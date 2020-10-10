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




// var ctx = document.getElementById("myPieChart");
// var myPieChart = new Chart(ctx, {
//   type: 'pie',
//   data: {
//     labels: ["", "O型", "B型", "AB型"],
//     datasets: [{
//         backgroundColor: [
//             "#BB5179",
//             "#FAFF67",
//             "#58A27C",
//             "#3C00FF"
//         ],
//         data: [38, 31, 21, 10]
//     }]
//   },
//   options: {
//     title: {
//       display: true,
//       text: '血液型 割合'
//     }
//   }
// });