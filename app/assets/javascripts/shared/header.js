$(function() {
  var menus = $('.header__inner__bottom__right__contents');
  $(menus).hover(
    function() {
      $('.header-todolists', this).show()
    },
    function() {
      $('.header-todolists', this).hide()
    }
  );
});