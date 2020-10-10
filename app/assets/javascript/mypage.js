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
      labels: ["favorite", "food", "shopping", "nature", "event"],
      datasets: [{
          backgroundColor: [
              "#3399FF",
              "#FAFF67",
              "#FF3366",
              "#33CC66",
              "#FFCC66"
          ],
          data: [gon.favorite, gon.food, gon.shopping, gon.nature, gon.event] 
      }]
    },
    options: {
      title: {
        display: true,
        text: 'POST DATA'
      }
    }
  }
  const context = $("#chart")
  const chart = new Chart(context, config)
})
