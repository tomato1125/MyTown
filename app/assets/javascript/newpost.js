
$(function(){
  //================================================================
  //共通の定数を定義
  //==================================================================
  // label-contentの直前に配置されている要素(今回はprev-content)を取得する
  
  const prevContent = $('.labelContent').prev();

  //============================================================
  //プレビューのhtmlを定義
  //============================================================
  function buildHTML(id,image) {
    var html = `<div class="previewBox">
                  <div class="upperBox">
                    <img src=${image} alt="preview">
                  </div>
                  <div class="lowerBox">
                    <div class="deleteBox">
                      <div class="imageDeleteBtn" data-delete-id= ${id}>削除</div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  //==================================================
  //ラベルのwidth・id・forの値を変更
  //==================================================
  function setLabel(count) {
    //プレビューが5個あったらラベルを隠す
    if (count == 5) { 
      $('.labelContent').hide();
    } else {
      //プレビューが4個以下の場合はラベルを表示
      $('.labelContent').show();
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定(prevcontentのwidthを取って、大枠(width:620px)から引き算する)
      labelWidth = (620 - parseInt($(prevContent).css('width')));  //parseIntは文字列を整数に変換するjavascriptの関数
      $('.labelContent').css('width', labelWidth);
      //id・forの値を変更
      $('.labelBox').attr({for: `post_images_attributes_${count}_image`});
    }
  }

  //====================================================
  //編集ページ(items/:i/edit)へリンクした際のアクション
  //====================================================
  if (window.location.href.match(/\/posts\/\d+\/edit/)){
    //プレビューの数を取得
    var count = $('.previewBox').length;
    //countに応じてラベルのwidth・id・forの値を変更
    setLabel(count) 
  }

  //=======================================================
  //プレビューの追加
  //=======================================================
  //hidden-fielsの値が変更したとき発火
  $(document).on('change', '.hiddenField', function() {
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-4]/g, '');
    //選択したfileのオブジェクトを取得
    var file = this.files[0];
    // PC内にあるファイルをアプリケーションに非同期で読み込む
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      // 直前に実行されたイベント（imageファイルの読み込み）を変数imageに代入
      var image = this.result;
      //htmlを作成
      var html = buildHTML(id,image);
      //ラベルの直前のプレビュー群にプレビューを追加
      $(prevContent).append(html);
      //プレビューの数を取得
      var count = $('.previewBox').length;
      //countに応じてラベルのwidth・id・forの値を変更
      setLabel(count);
    }
  });

  //=====================================================================
  // 画像の削除
  //=====================================================================
  $(document).on('click', '.imageDeleteBtn', function() {
    var id = $(this).attr('data-delete-id')
    //削除用チェックボックスにチェックを入れる
    if ($(`#post_images_attributes_${id}__destroy`).length) {
      $(`#post_images_attributes_${id}__destroy`).prop('checked',true);
    }
    //画像を消去
    $(this).parent().parent().parent().remove();
    //フォームの中身を削除
    $(`#post_images_attributes_${id}_image`).val("");
    //プレビューの数を取得
    var count = $('.previewBox').length;
    //countに応じてラベルのwidth・id・forの値を変更
    setLabel(count);
  });
});


// 送信中のloading画面の機能============================================================================

$(function() {
  $("#sending").click(function(){
    $.LoadingOverlay("show", {
      text :"Sending..."
    });
  });
});


// フォームを入力・選択するまで送信ボタンが押せないようにする=============================================
$(function() {
  //最初に送信ボタンを無効にする
  $('#sending').prop("disabled", true);
  
  //idに「input」と設定している入力欄に入力・選択した＆画像を選択した時にイベントが発火する
  $("[id^= input],#post_images_attributes_0_image").change(function () {
      //入力欄が空かどうか判定を定義するために、sendという変数を使ってフォームの中身の状態管理を行う。
      let send = true;
      //id=input~と指定している入力欄をひとつずつチェック&画像（インデックス番号が０番の画像）をチェックする
      $("[id^= input],#post_images_attributes_0_image").each(function(index) {
        //フォームの中身（値）を順番に確認し、もしフォームの値が空の時はsend = false とする
        if ($("[id^= input],#post_images_attributes_0_image").eq(index).val() === "") {
          send = false;
        }
      });
      //フォームが全て埋まっていたら(send = trueの場合)
      if (send) {
          //送信ボタンを有効にする
          $('#sending').prop("disabled", false);
      }
      // フォームが一つでも空だったら(send = falseの場合)
      else {
          //送信ボタンを無効にする
          $('#sending').prop("disabled", true);
      }
  });
});
