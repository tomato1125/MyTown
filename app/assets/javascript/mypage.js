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
$(function() {
  let tabs = $(".follow-nav");

  function tabSwitch() {
    $(".active").removeClass("active");

    $(this).addClass("active");

    const index = tabs.index(this);

    $(".FollowPage").removeClass("show").eq(index).addClass("show");
  }

  tabs.click(tabSwitch);
});

// グラフ====================================================================================

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
