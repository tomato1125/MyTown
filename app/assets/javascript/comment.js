// コメント送信の非同期通信化============================================================
$(function() {
  function buildHTML(comment) {
    let html = `<div class="comment">
                  <img src = '${comment.user_image}', class="commentAvater">
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>：
                  </strong>
                  ${comment.text}
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comments').prepend(html);
      $('.commentForm__textbox').val('');
      $('.commentForm__btn').prop('disabled', true);
    })
    .fail(function(){
      alert('error');
    })
  })
});

// コメントフォームの入力があるまで送信ボタンを無効化=====================================
//バリデーション


// ==============================================================================
$(function() {
  //最初に送信ボタンを無効にする
  // $('#commentSendBtn').prop("disabled", true);
  $('#commentSendBtn').prop("disabled", true);

  $('#commentInput').keyup(function () {
    let send = false;
    const chatComment = $(this).val().replace(/^\s+/, "");
    if (chatComment.length > 0) {
      send = true;
    }
    //フォームが全て埋まっていたら(send = trueの場合)
    if (send) {
      //送信ボタンを有効にする
      $('#commentSendBtn').prop("disabled", false);
    }
    // フォームが一つでも空だったら(send = falseの場合)
    else {
        //送信ボタンを無効にする
        $('#commentSendBtn').prop("disabled", true);
    }
  });
});