$(function() {
  function buildHTML(message) {
    let html = `<div class="Message">
                  <div class="Message-Avater">
                    <img src = '${message.user_image}', class="MessageAvater">
                  </div>
                  <strong>
                    <a href=/users/${message.user_id}, class: "MessageUserName">${message.user_name}</a>：
                    <span><%= ${message.message} %></span>
                  </strong>
                </div>
                <div class="MessageDate">
                  <%= ${message.date}("%Y-%m-%d %H:%M") %>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e) {
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
      $('.Messages').append(html);
      $('.MessageForm__textbox').val('');
      $('.MessageForm__btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});