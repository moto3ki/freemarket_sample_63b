$(document).on('turbolinks:load', function () {
  $('.mypage-nav-list-item').hover(
    function(){
      $(this).find('.icon-arrow-right').css({color: '#333'}).animate({right: "10px"}, 50);
      $(this).css({background: 'rgb(250, 250, 250)'})
    },
    function(){
      $(this).find('.icon-arrow-right').css({color: 'rgb(230, 230, 230)'}).animate({right: "16px"}, 50);
      $(this).css({background: '#fff'})
  });
});