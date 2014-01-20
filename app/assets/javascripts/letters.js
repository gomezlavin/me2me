// ------------------------------------------------
// Function to parse archived letters to display div
function parseArchivedLetters(data){
  $("#ltrs_hider_top").empty();

  if(data=="") {
    $("#ltrs_empty_top").show();
  } else {
    for(var i=0;i<data.length;i++){
      var created_date = data[i]["created_at"].substr(0, data[i]["created_at"].length-10);
      var delivery_date = data[i]["delivery_date"].substr(0, data[i]["created_at"].length-10);
      content = JST['templates/DisplayArchivedLetters']({data: data[i], created_date: created_date, delivery_date: delivery_date});
      $("#ltrs_hider_top").append(content);
    }
  }
}

// ------------------------------------------------
// Function to parse due letters to display div
function parseDueLetters(data){
  $("#ltrs_hider_bottom").empty();

  if(data=="") {
    $("#ltrs_empty_bottom").show();
  } else {
    for(var i=0;i<data.length;i++){
      var created_date = data[i]["created_at"].substr(0, data[i]["created_at"].length-10);
      var delivery_date = data[i]["delivery_date"].substr(0, data[i]["created_at"].length-10);
      content = JST['templates/DisplayDueLetters']({data: data[i], created_date: created_date, delivery_date: delivery_date});
      $("#ltrs_hider_bottom").append(content);
      $("#ltrs_hider_bottom").attr("disabled", "disabled").off("click");
    }
  }
}

// ------------------------------------------------
// Function to create a new letter in the database
var newLetter = function(){
  var subject = $("#ltr_subject").val();
  var body = $("#ltr_body").val();
  var ltr_day = $("#select_day").val();
  var ltr_month = $("#select_month").val();
  var ltr_year = $("#select_year").val();

  if($("#ltr_subject").val()=="" || $("#ltr_body").val()==""){
    if($("#ltr_subject").val()==""){
      $("#ltr_create_error").empty();
      $("#ltr_create_error").append("The SUBJECT field can't be empty!");
      $("#ltr_subject").css("backgroundColor", "#F9EBEA");
      $("#ltr_body").css("backgroundColor", "transparent");
    } else {
      $("#ltr_create_error").empty();
      $("#ltr_create_error").append("The LETTER field can't be empty!");
      $("#ltr_body").css("backgroundColor", "#F9EBEA");
      $("#ltr_subject").css("backgroundColor", "transparent");
    }
  }
  else{
    $("#ltr_create_error").empty();
    $("#ltr_subject").css("backgroundColor", "transparent");
    $("#ltr_body").css("backgroundColor", "transparent");

    var url = "/letters/" + current_user;
    $.ajax({
      url: url,
      type: "put",
      data: {
        subject: subject,
        body: body,
        day: ltr_day,
        month: ltr_month,
        year: ltr_year}
      }).done(function(){
        displayAllLetters();
      });

    $("#ltr_create_error").append("The LETTER was created successfuly!");
    setTimeout(function(){$("#ltr_create_error").empty()},3000);
    $("#ltr_subject").val("");
    $("#ltr_body").val("");
  }
}

// ------------------------------------------------
// Function to display all the users' stored letters
var displayAllLetters = function(){
  $("#ltr_createmsg").hide();
  $("#ltr_showmsg").show();
  $("#ltrs_empty_top").hide();
  $("#ltrs_empty_bottom").hide();
  $("#ltr_label_top").text("Archived letters");
  $("#ltr_label_bottom").text("Due letters");

  var url = "/letters/"+ current_user;
  $.ajax({
    url: url,
    type: "get"
  }).done(function(data){
    parseArchivedLetters(data[0]);
    parseDueLetters(data[1]);
  });
}








