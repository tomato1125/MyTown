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