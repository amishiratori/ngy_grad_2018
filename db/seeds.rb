if User.all.size == 0
    # 1
    User.create(
        user_name: "志賀俊佑",
        mentor_name: "しがしが",
        month: 8,
        date: 10
        )
    # 2
    User.create(
        user_name: "金美伶",
        mentor_name: "みりょん",
        month: 9,
        date: 27
        )
    # 3
    User.create(
        user_name: "内西功一",
        mentor_name: "しげる",
        month: 3,
        date: 2
        )
    # 4
    User.create(
        user_name: "井嶋亮太",
        mentor_name: "ワット",
        month: 7,
        date: 23
        )
    # 5
    User.create(
        user_name: "室田ゆう",
        mentor_name: "かんさい",
        month: 2,
        date: 19
        )
    # 6
    User.create(
    user_name: "西中智樹",
    mentor_name: "にっしー",
    month: 8,
    date: 14
    )
    # user = User.find_by(id: 6)
    # user.questions.create(
    #       author: "カーキ",
    #       quiz: "にっしーの最初のキャンプは？",
    #       choice1: "2016春ャンプ",
    #       choice2: "2016夏キャンプ",
    #       choice3: "2016秋学期スクール",
    #       answer: 1
    # )
    # user.questions.create(
    #       author: "ジャス",
    #       quiz: "にっしー激推しのメンバーといえば",
    #       choice1: "わだどん",
    #       choice2: "あやめ",
    #       choice3: "じんちゃん",
    #       answer: 2
    # )
    # user.questions.create(
    #       author: "ジャス",
    #       quiz: "2018春HAL名古屋に遊びに来たにっしーに降りかかった出来事とは？",
    #       choice1: "ダンサー",
    #       choice2: "メンター兼運営",
    #       choice3: "一発芸",
    #       answer: 2
    # )
    # user.questions.create(
    #       author: "わだどん",
    #       quiz: "2018春HAL名古屋にいなかったメンターは？",
    #       choice1: "おおってぃ",
    #       choice2: "ボッスン",
    #       choice3: "しがしが",
    #       answer: 1
    # )
end