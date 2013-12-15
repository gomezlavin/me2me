// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./templates
//= require_tree .
//= require_self


var current_user;

//=================================================
$(function() {

  // *******************************
  // INITIALIZING APP FOR USER
  // *******************************
  start();

  // *******************************
  // MESSAGE-RELATED EVENTS
  // *******************************

  // Display the messages div block
  $("#switch1").on("click", function() {
    $("#msg_block").show();
    $("#ltr_block").hide();
    $("#quote_block").hide();
  });

  // Show the form to create a new message
  $("#msg_new").on("click", function(event) {
    $("#msg_createmsg").show();
    $("#msg_showmsg").hide();
    $(".msg_message_label").text("Write a message or thought for your future self");
  });

  // Event where user creates a new message
  $("#msg_button").on("click", function(event) {
    event.preventDefault();
    newMessage();
  });

  // Event that displays all the user stored messages
  $("#msg_all").on("click", function(event) {
    displayAllMessages();
  });

  // Display all the messages with a certain tag
  $("#msg_tagms_box").on("click",".msg_tags_class", function(event) {
    event.preventDefault();
    displayTagMessages($(this).data("name"));
  });

  // Search messages with specific keywords
  $("#msg_search_button").on("click", function(event) {
    event.preventDefault();
    searchMessages();
  });


  // *******************************
  // LETTER-RELATED EVENTS
  // *******************************

  // Display the letters div block
  $("#switch2").on("click", function() {
    $("#msg_block").hide();
    $("#ltr_block").show();
    $("#quote_block").hide();
  });


  // *******************************
  // QUOTE-RELATED EVENTS
  // *******************************

  // Display the quotes div block
  $("#switch3").on("click", function() {
    $("#msg_block").hide();
    $("#ltr_block").hide();
    $("#quote_block").show();
  });

});





