(function(){
  var url = location.href;
  var title = $('title').html();
 
  // twitter シェアの生成
  var text = encodeURIComponent(title);
  var tweet_url = 'http://twitter.com/share?url=' + url + '&text=' + text;
  $('a.js-twitter-share').attr("href", tweet_url);
 
  // facebookシェアの生成
  var facebook_url = 'https://www.facebook.com/sharer/sharer.php?u=' + url;
  $('a.js-facebook-share').attr("href", facebook_url);
 
  // LINEシェア
  $('.js-line-share').off('click');
  $('.js-line-share').on('click', function(){
    var message = title + ' ' + url;
    var shareLink = 'http://line.me/R/msg/text/?' + encodeURIComponent(message);
    window.open(shareLink, '_blank');
  });
});