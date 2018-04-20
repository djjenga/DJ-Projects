/**
 * This is a jsPsych based oneline questionnaire for virtual agent appearance evaluation. 
 * Author : David C. Jeong
 * Data : 04/17/2018
 */
// --------- util function --------------
// load single javaScript with callback function 
function loadScript(url, callback) {
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    script.onreadystatechange = callback;
    script.onload = callback;
    head.appendChild(script);
}

function loadMoreFiles(urls) {
  for (i = 0; i < urls.length; i++) {
    var res = urls[i].split(".");
    var len = res.length
    var format = res[len - 1]
    // js
    if (format == 'js')
      $.getScript(urls[i])
      // css file 
    else {
        $('<style type="text/css"></style>')
        .html('@import url("' + urls[i] + '")')
        .appendTo("head");
      }
  }
}

var getCSRFToken = function() {
             return document.getElementsByTagName("meta")["csrf-token"].content;
           }
// dependences
var urls = ["https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css",
            "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ]

// --------- Interface ----------------//
// when loading the webpage, contomize the interface
window.onload = function(e){
  // instruction  
  var instruction = function(){
    /*
      // test Jquery
      if (window.jQuery) {  
          // jQuery is loaded  
          alert("Yeah!");
      } else {
          // jQuery is not loaded
          alert("Doesn't Work");
    }*/

    // load other dependent files
    loadMoreFiles(urls)
    // randomly assign the participant to one condition 
    // videos urls 
    videoURL = [
    "https://survey.az1.qualtrics.com/CP/File.php?F=F_1M8DYJKuufB366x",
    "https://survey.az1.qualtrics.com/CP/File.php?F=F_ctZ9NpF37ci09et",
    "https://survey.az1.qualtrics.com/CP/File.php?F=F_0qRXhNszj1cy4Yt",
    "https://survey.az1.qualtrics.com/CP/File.php?F=F_7O1Hmm2cfbi5gZD"]

    // generate random number 
    videoID = Math.floor(Math.random() * (videoURL.length - 1)) + 1;

      $("#root").append("<div id = 'instruction' class='panel panel-default'>\
        <div class='panel-heading'> <b>Instruction</b> </div>\
        <div class='panel-body'>\
        <p>This study involves watching videos of virtual characters speak, and then making judgments about the characters' personality.</p>\
        <p>Imagine that you are a student in an acting class or an acting rehearsal and this character is your Professor/Instructor.</p>\
        <button type='button' class='btn pull-right btn-default' onclick='next()'>Next -></button></div><div>");
    
      $("#root").append('<div id = "task1" style="display:none">\
        <div style="text-center">\
          <video class="qmedia" controls="true" height="600" preload="auto" width="600">\
            <source src="'+ videoURL[videoID] + '" type="video/mp4">\
            <embed align="middle" autoplay="true" bgcolor="white" class="qmedia" controller="true" height="600" \
              pluginspage="http://www.apple.com/quicktime/download/" src="'+ videoURL[videoID] + '\
              type="video/quicktime" width="600"></video>\
        </div><div class = "">\
          <div><h5>Please watch the video and then rate the personality of the virtual instructor by giving it a score from 1 to 5.</h5></div\
          <ul>\
              <li><lable>Helpful : <b id = "n1"></b></label>\
                <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                <input id = "v1" onchange="update(1)" type="range" min="1" max="5" value="3"></div></li>\
              <li><lable>Competent : <b id = "n2"></b></label>\
                  <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                  <input id = "v2" onchange="update(2)" type="range" min="1" max="5" value="3"></div></li>\
              <li><lable>Friendly : <b id = "n3"></b></label>\
                  <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                  <input id = "v3" onchange="update(3)" type="range" min="1" max="5" value="3"></div></li>\
              <li><lable>Likeable : <b id = "n4"></b></label>\
                  <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                  <input id = "v4" onchange="update(4)" type="range" min="1" max="5" value="3"></div></li>\
              <li><lable>Human-like : <b id = "n5"></b></label>\
                  <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                  <input id = "v5" onchange="update(5)" type="range" min="1" max="5" value="3"></div></li>\
              <li><lable>Dominant : <b id = "n6"></b></label>\
                  <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                  <input id = "v6" onchange="update(6)" type="range" min="1" max="5" value="3"></div></li>\
              <li><lable>Analytical : <b id = "n7"></b></label>\
                  <div class = "fixWidth"><b class = "pull-left">1</b> <b class = "pull-right">5</b>\
                  <input id = "v7" onchange="update(7)" type="range" min="1" max="5" value="3"></div></li>\
              </ul>\
        </div></br><button id="submit" type="button" class="btn btn-default pull-right" onclick="submit('+ videoID +')"">Submit</button></div>')
  }
  // load Jquery first 
  loadScript("https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js", instruction);
   
}

// --------- dynamic control --------------//
// next step
var next = function(){
  $("#instruction").fadeOut();
  $("#task1").show()
            
};
// update interface 
var update = function(num){
  content = $('#v'+num).val()
  $('#n'+num).text("Your rating is : " + content);
};

var submit = function(vID){
  var user_id = $("#user_id").html();
  var study_id = $("#study_id").html();
  var redirect = function(response) {window.location = response.redirect_url;};
  results = []
  for (i = 1; i <= 7; i++){
    val = $('#v'+i).val()
    key = 'Q'+i//$('#n'+i).parent().text().split(' :')[0]
    obj = {}
    obj[key] = val
    results.push(obj)
  }
  $("#task1").hide()
  $.post({
    url: "/studies.json",
    headers: {
              'X-CSRF-Token': getCSRFToken(),
            },
    dataType: 'json',
    data: {
            study: {
                    user_id: user_id,
                    study_id: study_id,
                    video_id: vID,
                    custom_study_results: JSON.stringify(results),
                    score: 50
                  }
          },
    success: redirect
  });

}