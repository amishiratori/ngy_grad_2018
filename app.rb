require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require './models.rb'
require 'sinatra/base'
require 'net/http'
require 'rest-client'
require 'google/apis/sheets_v4'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

before do
  if request.path_info != '/' && request.path_info != '/login' && request.path_info != '/remake_questions_table' && request.path_info != '/remake_videos_table' && request.path_info != '/active_mentor'
    if current_user.nil?
      redirect '/'
    end
  end
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(user_name: params[:user_name])
  date = params[:date].split('-')
  if user.blank?
    @error = '名前が違います'
  elsif user.mentor_name == params[:mentor_name] && user.month == date[1].to_i && user.date == date[2].to_i
    session[:user] = user.id
    redirect "/user"
  elsif user.mentor_name != params[:mentor_name]
    @error = 'メンター名が違います'
  elsif user.month != date[1] || user.date != date[2]
    @error = '誕生日が違います'
  end
end

get '/active_mentor' do
  erb :active_mentor
end

get '/user' do
  @user = current_user
  erb :main_page
end

get '/start_quiz' do
  if current_user.videos.where(played: false).blank?
    current_user.update({
        clear: true
      })
    @questions = current_user.questions.all
    erb :clear
  else
    questions = current_user.questions.where(clear: false)
    number = questions[rand(questions.length)].id
    redirect  "/quiz/#{number}"
  end
end

get '/quiz/:id' do
  @quiz = current_user.questions.find_by(id: params[:id])
  erb :quiz
end

post '/quiz/check/:id' do
  quiz = current_user.questions.find_by(id: params[:id])
  select_answer = params[:select_answer].to_i
  score = current_user.score
  
  #正解の時
  if quiz.answer == select_answer
        current_user.update ({
          score: score + 1
        })
        quiz.update ({
          clear: true
        })
        if current_user.videos.where(played: false).blank?
          redirect '/clear'
        else
          index = current_user.videos.where(played: false)
          number = index[rand(index.length)].id
          redirect  "/video/#{number}"
        end
  #不正解の時
  else
      questions = current_user.questions.where(clear: false)
      number = questions[rand(questions.length)].id
      redirect  "/quiz/#{number}"
  end
  
  #質問のclearフラグにfalseがない時
  # if current_user.questions.where(clear: false).blank?
  # if current_user.score == current_user.videos.length
  #     current_user.update({
  #       clear: true
  #     })
  #     redirect '/clear'
  # end
  # if current_user.score == (current_user.questions.length / current_user.videos.length)
  #     current_user.update ({
  #     #   score: 1
  #     })
  #     index = current_user.videos.where(played: false)
  #     number = index[rand(index.length)].id
  #     redirect  "/video/#{number}"
  # else
  #     questions = current_user.questions.where(clear: false)
  #     number = questions[rand(questions.length)].id
  #     redirect  "/quiz/#{number}"
  # end
end

get '/video/:id' do
  @user = current_user
  @video = current_user.videos.find_by(id: params[:id])
  @video.update({
    played: true
  })
  
  if current_user.score == current_user.videos.length
      current_user.update({
        clear: true
      })
  end
  
  erb :video
end

get '/clear' do
  if current_user.videos.where(played: false).blank?
    current_user.update({
        clear: true
      })
    @questions = current_user.questions.all
    erb :clear
  else
    erb :clear
  end
  
end

get '/collection' do
  @videos = current_user.videos.where(played: true)
  erb :collection
end

get '/remake_questions_table' do
  credential_file = './MyProject-e3ddd3ab5bd6.json'
  authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(credential_file),
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
  )  
  authorizer.fetch_access_token!
  s_service = Google::Apis::SheetsV4::SheetsService.new
  s_service.authorization = authorizer
  User.all.each do |user|
    for num in 3..23
      num = num.to_s
      data = s_service.batch_get_spreadsheet_values('1l2OC4jWJRjVDF9lpGdb4LAtuTLQTWsNQvr2PwjWhU8M', ranges: user.mentor_name + '!C' + num + ':H' + num).value_ranges.first.values
      unless data.blank?  
        user.questions.create(
          author: data[0][0],
          quiz: data[0][1],
          choice1: data[0][2],
          choice2: data[0][3],
          choice3: data[0][4],
          answer: data[0][5]
          )
      else
        break
      end
    end
  end
end


get '/remake_videos_table' do
  credential_file = './MyProject-e3ddd3ab5bd6.json'
  authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(credential_file),
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
  )  
  authorizer.fetch_access_token!
  s_service = Google::Apis::SheetsV4::SheetsService.new
  s_service.authorization = authorizer
  
    for num in 2..23
      num = num.to_s
      data = s_service.batch_get_spreadsheet_values('1l2OC4jWJRjVDF9lpGdb4LAtuTLQTWsNQvr2PwjWhU8M', ranges: '動画リンク集!A' + num + ':G' + num).value_ranges.first.values
      # しがしが
      unless data[0][1].blank?  
        User.find_by(id: 1).videos.create(
          author: data[0][0],
          url: data[0][1]
          )
      end
      # わっと
      unless data[0][2].blank?  
        User.find_by(id: 4).videos.create(
          author: data[0][0],
          url: data[0][2]
          )
      end
      # かんさい
      unless data[0][3].blank?  
        User.find_by(id: 5).videos.create(
          author: data[0][0],
          url: data[0][3]
          )
      end
      # みりょん
      unless data[0][4].blank?  
        User.find_by(id: 2).videos.create(
          author: data[0][0],
          url: data[0][4]
          )
      end
      # しげる
      unless data[0][5].blank?  
        User.find_by(id: 3).videos.create(
          author: data[0][0],
          url: data[0][5]
          )
      end
      # にっしー
      unless data[0][6].blank?  
        User.find_by(id: 6).videos.create(
          author: data[0][0],
          url: data[0][6]
          )
      end
    end
end


