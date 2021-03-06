particlesJS('sakura',{
  "particles": {
    "number": {
      "value": 80,
      "density": {
        "enable": true,
        "value_area": 4000
      }
    },
    "shape": {
      "type": "image",
      "image": {
        "src": "./images/sakura_fubuki.png",
        "width": 100,
        "height": 100
      }
    },
    "opacity": {
      "value": 0.2,
      "random": true,
      "anim": {
        "enable": true,
        "speed": 1,
        "opacity_min": 0.1,
        "sync": false
      }
    },
    "size": {
      "value": 9,
      "random": false,
      "anim": {
        "enable": true,
        "speed": 1,
        "size_min": 8,
        "sync": false
      }
    },
    "line_linked": {
      "enable": false,
      "distance": 150,
      "color": "#ffffff",
      "opacity": 0.4,
      "width": 1
    },
    "move": {
      "enable": true,
      "speed": 2,
      "direction": "bottom",
      "random": true,
      "straight": false,
      "out_mode": "out",
      "bounce": false,
      "attract": {
        "enable": false,
        "rotateX": 10000,
        "rotateY": 3866.8234439981356
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": false,
        "mode": "repulse"
      },
      "onclick": {
        "enable": true,
        "mode": "repulse"
      },
      "resize": true
    },
    "modes": {
      "grab": {
        "distance": 400,
        "line_linked": {
          "opacity": 1
        }
      },
      "bubble": {
        "distance": 400,
        "size": 40,
        "duration": 2,
        "opacity": 8,
        "speed": 3
      },
      "repulse": {
        "distance": 200,
        "duration": 0.4
      },
      "push": {
        "particles_nb": 4
      },
      "remove": {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true
});

// {
// "particles":{
// //--シェイプの設定----------
//     "number":{
//       "value":10, //シェイプの数
//       "density":{
//         "enable":true, //シェイプの密集度を変更するか否か
//         "value_area":200 //シェイプの密集度
//       }
//     },
//     "shape":{
//       "type":"circle", //シェイプの形（circle:丸、edge:四角、triangle:三角、polygon:多角形、star:星型、image:画像）
//       "stroke":{
//         "width":0, //シェイプの外線の太さ
//         "color":"#ffcc00" //シェイプの外線の色
//       },
//       //typeをpolygonにした時の設定
//       "polygon": {
//         "nb_sides": 5 //多角形の角の数
//       },
//     },
//     "color":{
//       "value":"#ffffff" //シェイプの色
//     },
//     "opacity":{
//       "value":1, //シェイプの透明度
//       "random":false, //シェイプの透明度をランダムにするか否か
//       "anim":{
//         "enable":false, //シェイプの透明度をアニメーションさせるか否か
//         "speed":10, //アニメーションのスピード
//         "opacity_min":0.1, //透明度の最小値
//         "sync":false //全てのシェイプを同時にアニメーションさせるか否か
//       }
//     },
//     "size":{
//       "value":30, //シェイプの大きさ
//       "random":true, //シェイプの大きさをランダムにするか否か
//       "anim":{
//         "enable":false, //シェイプの大きさをアニメーションさせるか否か
//         "speed":40, //アニメーションのスピード
//         "size_min":0.1, //大きさの最小値
//         "sync":false //全てのシェイプを同時にアニメーションさせるか否か
//       }
//     },
// //--------------------
//
// //--動きの設定----------
//     "move":{
//       "speed":10, //シェイプの動くスピード
//       "straight":false, //個々のシェイプの動きを止めるか否か
//       "direction":"none", //エリア全体の動き(none、top、top-right、right、bottom-right、bottom、bottom-left、left、top-leftより選択)
//       "out_mode":"out" //エリア外に出たシェイプの動き(out、bounceより選択)
//     }
// //--------------------
//
//   },
//
//   "interactivity":{
//     "detect_on":"canvas",
//     "events":{
// //--クリック時の処理----------
//       "onclick":{
//         "enable":true, //クリックが有効か否か
//         "mode":"push" //クリック時に発動する動き(下記modes内のgrab、repulse、bubble、push、removeより選択)
//       },
//     },
//   },
//   "retina_detect":true, //Retina Displayを対応するか否か
//   "resize":true //canvasのサイズ変更にわせて拡大縮小するか否か
// }
// );
