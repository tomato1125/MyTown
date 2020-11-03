// MypageのTop,POST,Bookmaekのタブ切り替え機能===============================
$(function() {
  let tabs = $(".user-nav");

  function tabSwitch() {
    $(".active").removeClass("active");

    $(this).addClass("active");

    const index = tabs.index(this);

    $(".page").removeClass("show").eq(index).addClass("show");
  }

  tabs.click(tabSwitch);
});

//follow・followerモーダル画面//=================================================================
// $(function() {
//   let tabs = $(".follow-nav");

//   function tabSwitch() {
//     $(".active").removeClass("active");

//     $(this).addClass("active");

//     const index = tabs.index(this);

//     $(".FollowPage").removeClass("show").eq(index).addClass("show");
//   }

//   tabs.click(tabSwitch);
// });

// カテゴリー別投稿数のグラフ====================================================================================
$(function() {
 
  const config = {
    type: 'pie',
    data: {
      color: "#ffffff",
      labels: ["favorite", "food", "shopping", "nature", "event"],
      datasets: [{
          color: "#ffffff",
          backgroundColor: [
              "#BBFFFF",
              "#FFFFBB",
              "#FF9872",
              "#93FFAB",
              "#FFCC66"
          ],
          data: [gon.favorite, gon.food, gon.shopping, gon.nature, gon.event] 
      }]
    },
    options: {
      title: {
        display: true,
        text: '投稿数（カテゴリー別）',
        fontColor: "white", 
        fontSize: 15
      },
      legend: { 
        labels: { 
         fontColor: "white", 
         fontSize: 15
        } 
      },
    }
  }
  const context = $("#chart")
  const chart = new Chart(context, config)
});


// DM送付に関する非同期処理の記述=====================================================
$(function() {
  function buildHTML(message) {
    let html = `<div class="Message">
                  <div class="MessageInfo">
                    <div class="Message-Avater">
                      <img src = '${message.user_image}', class="MessageAvater">
                    </div>
                    <strong>
                      <a href=/users/${message.user_id}, class: "MessageUserName">${message.user_name}</a>：
                    </strong>
                    ${message.text}
                  </div>
                  <div class="MessageDate">${message.created_at}</div>
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
      $('.Messages').prepend(html);
      $('.MessageForm__textbox').val('');
      $('.MessageForm__btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});