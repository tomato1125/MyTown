// フラッシュメッセージのフェードアウト効果=========================================
$(function() {
  $(".Notification").fadeOut(4000);
})


// リンクボタン押した後にリンク先にスクロールするアニメーション=========================
$(function(){
  $('a[href^="#"]').click(function(){
    let speed = 400;
    let href= $(this).attr("href");
    let target = $(href == "#" || href == "" ? 'html' : href);
    let position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});


// ログインユーザー名をマウスオーバーした時にメニュー表示される=================================
$(function() {
  $(".loginUser").hover(function(){
    $(this).children(".dropDownMenu").stop().slideToggle();
  });
});


// お知らせアイコンをマウスオーバーした時に表示される吹き出し====================================
$(function() {
  $('[data-toggle="tooltip"]').tooltip()
})


// ブラウザ幅700px以下の時に表示されるバーガーメニュー機能=======================================
$(function(){
  $('.bargermenu-btn').on('click', function(){
    $('.bargermenu').toggleClass('is-active');
  });
  $('.bargermenu-closebtn').on('click', function(){
    $('.bargermenu').toggleClass('is-active');
  });
});
