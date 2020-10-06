// $(function() {
//   function hitpost(post) {
//     let html = `<div class="HitPost clearfix">
//                   <p class="HitPost__name">${post.content}</p>
//                 </div>
//                 `;
//     $("#UserSearchResult").append(html);
//   }

//   function noHitPost() {
//     let html = `<div class="HitPost claerfix">
//                   <p class="HitPost__name">ユーザーが見つかりません</p>
//                 </div>
//                 `;
//     $("#UserSearchResult").append(html);
//   }

//   $("#Search_Form").on("keyup", function() {
//     let input = $("#Search_Form").val();
//     $.ajax({
//       type: 'GET',
//       url: '/posts/serch',
//       data: { keyword: input },
//       dataType: "json"
//     })
//     .done(function(posts) {
//       $("#UserSearchResutl").empty();
//       if (posts.length !== 0) {
//         posts.forEach(function(post) {
//           hitpost(post);
//         });
//       } else if (input.length == 0) {
//         return false;
//       } else {
//         noHitPost();
//       }
//     })
//     .fail(function() {
//       alert("通信エラーです。ユーザーが表示できません。");
//     });
//   });
// });