$(function(){
  
  var href = location.pathname;
  var user_url = "/user"

  if (href.indexOf(user_url) === 0) {
    
    if (href == "/users/notices"){
      $("#notice-tab").addClass("active");
      $("#notice-lists").addClass("active-lists");
    }
    else if (href == "/users/todolists"){
      $("#todo-tab").addClass("active");
      $("#todo-lists").addClass("active-lists");
    }
  }
});