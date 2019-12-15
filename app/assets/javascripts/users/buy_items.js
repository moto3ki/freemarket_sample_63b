$(function(){
  
  var href = location.pathname;
  var user_url = "/user"

  if (href.indexOf(user_url) === 0) {
    
    if (href == "/users/buying_items"){
      $("#buying-tab").addClass("active");
      $("#buying-items").addClass("active-items");
    }
    else if (href == "/users/bought_items"){
      $("#bought-tab").addClass("active");
      $("#bought-items").addClass("active-items");
    }
  }
});