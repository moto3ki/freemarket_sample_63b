$(document).on('turbolinks:load', function () {
  let newsTabs = $(".information__tabs__btn");
  newsTabsAry = Array.prototype.slice.call(newsTabs);
  
  function newsTabSwitch () {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = newsTabs.index(this);
    $(".content__list").eq(index).addClass("active")
  }
  
  let itemTabs = $(".buy-item__tabs__btn");
  itemTabsAry = Array.prototype.slice.call(itemTabs);
  
  function itemTabSwitch () {
    $(".active-2").removeClass("active-2");
    $(this).addClass("active-2");
    const index = itemTabs.index(this);
    $(".buy-item__content__list").eq(index).addClass("active-2")
  }
  
  newsTabs.click(newsTabSwitch);
  itemTabs.click(itemTabSwitch);
  
});