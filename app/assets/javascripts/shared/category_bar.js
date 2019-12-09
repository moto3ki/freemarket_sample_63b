$(function(){
  $('.header__inner__bottom__left--category').hover(
    function(){
      $('.list-parent').show()
    },
    function(){
      $('.list-parent').hide()
    });

  $('.list-parent').hover(
    function(){
      $('.list-parent').show()
    },
    function(){
      $('.list-parent').hide()
    });

  $('.list-parent__text').hover(
    function(){
      $(this).find('.list-child').show();
      $(this).children('a').css({color: '#fff'})
    },
    function(){
      $(this).find('.list-child').hide()
      $(this).children('a').css({color: 'black'})
    });

  $('.list-child__text').hover(
    function(){
      $(this).find('.list-grandchild').show()
    },
    function(){
      $(this).find('.list-grandchild').hide()
    });

});