// ------------------------------------------------
// Function to populate the messages and tags divs
var populateTags = function(data){
  for(var i=0;i<data.length;i++){
    if(i==0 || data[i]==""){
      content = JST['templates/msgPopulateTagsFirst']({value: data[i]});
      $("#msg_tagms_tags").append(content);
    } else {
      content = JST['templates/msgPopulateTagsOther']({value: data[i]});
      $("#msg_tagms_tags").append(content);
    }
  }
}

// ------------------------------------------------
// Function to parse and append them to display div
function parseMessages(data){
  for(var i=0;i<data.length;i++){
    var date = data[i]["created_at"].substr(0, data[i]["created_at"].length-10);
    content = JST['templates/msgDisplayedMessage']({value: data[i], date: date});
    $("#msgs_hider").append(content);
  }
}

// ------------------------------------------------
// Function to create a new message in the database
var newMessage = function(){
  var title = $("#msg_input_title").val();
  var idea = $("#msg_input_idea").val();
  var tags = $("#msg_input_tags").val();
  var tags_array = tags.split(",");

  if($("#msg_input_idea").val()==""){
    $("#msg_create_error").append("The MESSAGE FIELD can't be empty!");
    $("#msg_input_idea").css("backgroundColor", "#F9EBEA");
  }
  else{
    $("#msg_create_error").empty();
    $("#msg_input_idea").css("backgroundColor", "transparent");
    for(var i=0;i<tags_array.length;i++)
      tags_array[i] = tags_array[i].trim().toUpperCase();
    var url = "/messages/" + current_user;
    $.ajax({
      url: url,
      type: "put",
      data: {
        title: title,
        idea: idea,
        tags: tags_array}
      }).done(function(data){
        $("#msg_tagms_tags").empty();
        populateTags(data);
      });

    $("#msg_create_error").append("The MESSAGE was created successfuly!");
    setTimeout(function(){$("#msg_create_error").empty()},3000);
    $("#msg_input_title").val("");
    $("#msg_input_idea").val("");
    $("#msg_input_tags").val("");
  }
}

// ------------------------------------------------
// Function to display all the users' stored messages
var displayAllMessages = function(){
  $("#msg_createmsg").hide();
  $("#msgs_empty").hide();
  $("#msg_showmsg").show();
  $(".msg_message_label").text("Stored messages");
  var url = "/messages/"+ current_user;
  $.ajax({
    url: url,
    type: "get"
  }).done(function(data){
    $("#msgs_hider").empty();
    if(data[0]=="") {
      $("#msgs_empty").show();
    } else {
      parseMessages(data[0]);
    }
  });
}

// ------------------------------------------------
// Function to display the messages for a selected tag
var displayTagMessages = function(tag){
  $("#msg_createmsg").hide();
  $("#msgs_empty").hide();
  $("#msg_showmsg").show();
  $("#msgs_hider").empty();
  $(".msg_message_label").text("Message tag: " + tag);

  var url = "/messages/tag";
  var tag_data = tag;
  $.ajax({
    url: url,
    type: "post",
    data: {tag: tag_data}
  }).done(function(data){
    parseMessages(data);
  });
}

// ------------------------------------------------
// Function to search for messages with specific keywords in them
var searchMessages = function(){
$(".msg_message_label").text("Search messages");
  $("#msgs_hider").empty();
  $("#msg_createmsg").hide();
  $("#msgs_empty").hide();
  $("#msg_showmsg").show();
  var search = $("#msg_search_field").val();
  $("#msg_search_field").val("");
  if(search!=""){
    var url = "/messages/search";
    $.ajax({
      url: url,
      type: "post",
      data: {search: search}
    }).done(function(data){
      if(data==null){
        content = JST['templates/msgNoSearchResults']({search: search});
        $("#msgs_hider").append(content);
      }
      else{
        content = JST['templates/msgYesSearchResults']({search: search});
        $("#msgs_hider").append(content);
        parseMessages(data);
      }
    });
  }
}



