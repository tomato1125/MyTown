$(function(){
  
  const prevImage = $('.image').next();

  function buildHTML(id,image) {
    var html = `<div class="prevImageBox">
                  <div class="upper-box">
                    <img src=${image} alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="delete-box">
                      <div class="delete-btn" data-delete-id= ${id}>削除</div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  function setLabel(count) {
    //プレビューが5個あったらラベルを隠す
    if (count == 1) { 
      $('.imageInput').hide();
    } else {
      //プレビューが4個以下の場合はラベルを表示
      $('.imageInput').show();
    }
  }
  
  //hidden-fielsの値が変更したとき発火
  $(document).on('change', '.imageInput', function() {
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id');
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
      $(prevImage).append(html);
      //プレビューの数を取得
      $('.imageInput').hide();
      // var count = $('.imageInput').length;
      //countに応じてラベルのwidth・id・forの値を変更
      // setLabel(count);
      // return
    }
  });

  $(document).on('click', '.delete-btn', function() {
    var id = $(this).attr('data-delete-id')
    //削除用チェックボックスにチェックを入れる
    // if ($(`#item_images_attributes_${id}__destroy`).length) {
    //   $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
    // }
    //画像を消去
    $(this).parent().parent().parent().remove();
    //フォームの中身を削除
    $('.imageInput').val("");
    //プレビューの数を取得
    // var count = $('.imageInput').length;
    //countに応じてラベルのwidth・id・forの値を変更
    // setLabel(count);
    $('.imageInput').show();
  });
});