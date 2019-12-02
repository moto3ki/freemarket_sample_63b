$(function(){
  
  var href = location.pathname;
  var user_url = "/user"

  if (href.indexOf(user_url) === 0) {
    
    if (href == "/users/selling_items"){
      $("#selling-tab").addClass("active");
      $("#selling-items").addClass("active-items");
    }
    if (href == "/users/sold_items"){
      $("#sold-tab").addClass("active");
      $("#sold-items").addClass("active-items");
    }
  }
});