
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
  $("form").on('submit', function(){
    $.LoadingOverlay("show", {
      text :"Sending..."
    });
  });
});


// 必須項目入力するまで送信ボタンが押せないようにする=============================================
$(function() {
// $(document).on('change', "[id^= input]", function() {
  //始めにjQueryで送信ボタンを無効化する
  $('#sending').prop("disabled", true);
  
  //idに「input」と設定している入力欄の操作時
  $("[id^= input],#post_images_attributes_0_image").change(function () {
      //必須項目が空かどうかフラグ
      let flag = true;
      //必須項目をひとつずつチェック
      $("[id^= input],#post_images_attributes_0_image").each(function(e) {
        //もし必須項目が空なら
        if ($("[id^= input],#post_images_attributes_0_image").eq(e).val() === "") {
          flag = false;
        }
      });
      //全て埋まっていたら
      if (flag) {
          //送信ボタンを復活
          $('#sending').prop("disabled", false);
      }
      else {
          //送信ボタンを閉じる
          $('#sending').prop("disabled", true);
      }
  });
});


