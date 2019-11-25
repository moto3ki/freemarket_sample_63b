$(document).on('turbolinks:load', function () {
  $('.mypage-nav-list-item').hover(
    function(){
      $(this).find('.icon-arrow-right').css({color: '#333'}).animate({right: "10px"}, 20);
      $(this).css({background: '#f8f8f8'})
    },
    function(){
      $(this).find('.icon-arrow-right').css({color: '#ccc'}).animate({right: "16px"}, 20);
      $(this).css({background: '#fff'})
  });
});