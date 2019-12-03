$(function(){
  let news_tabs = $(".information__tabs__btn");
  
  function newsTabSwitch () {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = news_tabs.index(this);
    $(".content__list").eq(index).addClass("active")
  }
  
  
  let item_tabs = $(".buy-item__tabs__btn");
  
  function itemTabSwitch () {
    $(".active-2").removeClass("active-2");
    $(this).addClass("active-2");
    const index = item_tabs.index(this);
    $(".buy-item__content__list").eq(index).addClass("active-2")
  }
  
  news_tabs.click(newsTabSwitch);
  item_tabs.click(itemTabSwitch);
  
});