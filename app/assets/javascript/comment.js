$(function() {
  function buildHTML(comment) {
    let html = `<div class="comment">
                  <img src = '${comment.user_image}', class="CommentAvater">
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
      $('.comments').append(html);
      $('.CommentForm__textbox').val('');
      $('.CommentForm__btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});