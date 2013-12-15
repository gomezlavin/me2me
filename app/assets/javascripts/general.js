// ------------------------------------------------
// Get current user from server
var getCurrentUser = function(){
  var cur_user;
  var url = "/users/current";
  $.ajax({
    url: url,
    type: "get"
  }).done(function(data){
    current_user = data[0].id;
    loadUser();
  });
}

// ------------------------------------------------
// Function loads the initial parameters when user logs in
var loadUser = function(){
  $("#msg_createmsg").show();
  $("#msg_showmsg").hide();
  $(".msg_message_label").text("Write a message or thought for your future self");
  var url = "/messages/"+ current_user;
  $.ajax({
    url: url,
    type: "get"
  }).done(function(data){
    $("#msg_tagms_tags").empty();
    populateTags(data[1]);
  });
}





