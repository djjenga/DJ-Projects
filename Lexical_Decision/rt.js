var num_examples = 2;
var num_trials = 15;
var focus_delay = 1500;
var focus_icon = "+";
var focus_icon_color = "#FFFFFF";
var mid_round_delay = 2500;
var show_feedback = true;
var userID;
var words = [];

function generateList()
{
	var wordList = [];
	
	for(var i = 0; i < num_trials / 3; i++)
	{
		var neutralIndex = Math.floor(Math.random() * neutralWords.length);
		var justiceIndex = Math.floor(Math.random() * justiceWords.length);
		var nonIndex = Math.floor(Math.random() * nonWords.length);
		
		wordList.push( { type: "neutral", word: neutralWords[neutralIndex] } );
		wordList.push( { type: "justice", word: justiceWords[justiceIndex] });
		wordList.push( { type: "nonword", word: nonWords[nonIndex] });
	}
	
	// let's shuffle our list
	var shuffledWords = [];
	for(var i = 0; i < num_trials; i++)
	{
		var randomIndex = Math.floor(Math.random() * wordList.length); // pick a random word from wordList
		shuffledWords.push(wordList[randomIndex]); // add the chosen word to the random-order list
		wordList.splice(randomIndex, 1); // remove the word from the non-random list so we don't choose it again
	}
	
	return shuffledWords;
}

function initialize() {
//  try { if ("num_examples" in variables) num_examples=parseInt(variables["num_examples"]); } catch (err) {}
  try { if ("num_trials" in variables) num_trials=parseInt(variables["num_trials"]); } catch (err) {}
  try { if ("focus_delay" in variables) focus_delay=parseInt(variables["focus_delay"]); } catch (err) {}
  try { if ("focus_icon" in variables) focus_icon=variables["focus_icon"]; } catch (err) {}
  try { if ("focus_icon_color" in variables) focus_icon_color=variables["focus_icon_color"]; } catch (err) {}
  try { if ("mid_round_delay" in variables) mid_round_delay=parseInt(variables["mid_round_delay"]); } catch (err) {}
  
  try 
  { 
  	if ("show_feedback" in variables) 
	{
		show_feedback = variables["show_feedback"];
		if(show_feedback.indexOf("false") != -1)
			show_feedback = false;
		else
			show_feedback = true;
	}
  } 
  catch (err) {}
  
  $("#instructions_link").click(popup_instructions);
  $("#continue_button").click(done_instructions);  
  $("#done_button").click(finish);
  $("#answer").keydown(answer_keydown);
  $("#continue_button").fadeIn();
  
  words = generateList();
  userID = randomString(15);
  
  try 
  {
	  if ("num_examples" in variables) 
	  {
	  	num_examples = parseInt(variables["num_examples"]); 
	  }
	  else
  	  {
	  	num_examples = exampleWords.length;
      }
  }
  catch (err) {}
  
  $("#instrNum").html(num_examples);
}

function popup_instructions() {
  var pi = $("#popup_instructions");
  if (pi.is(':visible')) {
    pi.fadeOut();    
  } else {
    pi.fadeIn();    
  }
}

function done_instructions() {
  $("#instructions").fadeOut(function() { loadExampleRound(1); });
  //$("#instructions").fadeOut(function() { loadTrialRound(1) });
}

var in_example = true;
function loadExampleRound(rnd) {
  setRound(rnd);
  in_example = true;
  loadRound(rnd,"Example",rnd,num_examples,exampleWords[(rnd - 1) % exampleWords.length].word,exampleWords[(rnd - 1) % exampleWords.length].type);
}

function loadTrialRound(rnd) 
{
	setRound(rnd + 100);
	in_example = false;
	loadRound(rnd+100,"Trial",rnd,num_trials,words[rnd - 1].word,words[rnd - 1].type);
}

var FOCUS = 1;
var TYPING = 2;
var ANSWERED = 3;

var flash_timer = null;
var cur_question = null;
var cur_answer = null;
var mode = 0;

function loadRound(internal_round_number, title, rnd_num, total_rnds,question,answer) {
  cur_question = question;
  cur_answer = answer;
  $(".beginRoundHide").hide();
  $("#question").html(focus_icon);
  $("#round_display").html(title+" "+rnd_num+"/"+total_rnds);
  $("#round_display").fadeIn();
  $("#answer").val("");  
  $("#question").show();
  $("#answer").show();
  $("#answer").focus();
  mode = FOCUS;
  flash_timer = setTimeout(show_question, focus_delay);
  
  //console.log("c?", cur_question, "?", question, "col", color, "ans", answer, "foc", focus_icon, "focc", focus_icon_color, "rnd", rnd_num, "total", total_rnds);
}

var startTime = null;
var respTime = null;
var stopTime = null;
var reactionTime = null;
var totalTime = null;
function show_question() {
  respTime = null;
  var q = $("#question");
  q.html(cur_question);
  startTime = new Date().getTime();
  $("#answer").focus();
  mode=TYPING;
  if (in_example) {
    $("#hint").fadeIn();
  }
}

function answer_keydown(e) 
{
	if(mode != TYPING) 
	{
		return false;
	}
	if(e.keyCode == 65 || e.keyCode == 76) // a or l
	{
		respTime = new Date().getTime();
		answerComplete(String.fromCharCode(e.keyCode));
		return true;
	}
	else // disable EVERY OTHER KEY
	{
		return false;
	}
}

var numCorrect = 0;
var numIncorrect = 0;
var totalReactionTime = 0;

function answerComplete(ans) {
  //alert(cur_answer);
  if (!respTime) { // in case they don't make an answer
    respTime=new Date().getTime();
  }
  stopTime = new Date().getTime();
  mode = ANSWERED;
  answer = ans;
  reactionTime = respTime-startTime;
  totalTime = stopTime-startTime;
  
  var correct = false;
  if(answer.toLowerCase().indexOf("l") != -1 && cur_answer == "nonword")
  {
	  correct = true;
  }
  if(answer.toLowerCase().indexOf("a") != -1 && (cur_answer == "justice" || cur_answer == "neutral"))
  {
	  correct = true;
  }
  
  submit('<reaction word="'+cur_question+'" answer="'+answer+'" correct="'+correct+'" reaction="'+reactionTime+'" total="'+totalTime+'" userID="'+totalTime+'" />');
  
  $("#hint").fadeOut();
  if (correct) 
  {
    correctAnswer();
  } 
  else 
  {
    incorrectAnswer();
  }
  setTimeout(startNextRound,mid_round_delay);
}

function incorrectAnswer() {
  if (in_example) {
	$("#incorrect").fadeIn();  
    currentRound--;
    setTimeout(function() {
      //$("#hint_txt").html("Type in '"+cur_answer.split(",")[0]+"'");   
	  if(cur_answer == "nonword")
	  	$("#hint_txt").html("Type in 'l'");
	  else
	    $("#hint_txt").html("Type in 'a'");
      $("#try_again").fadeIn();    
    }, 1000);
  } else {
	if(show_feedback)
		$("#incorrect").fadeIn();  
    totalReactionTime+=reactionTime;
    numIncorrect++;
  }
}

function correctAnswer() {
  if (in_example) {
	$("#correct").fadeIn();
    setTimeout(function() {
      $("#hint_txt").html("Enter the correct response ('a' or 'l').");    
    }, 1000);
  } else {
	if(show_feedback)
		$("#correct").fadeIn();  
    totalReactionTime+=reactionTime;
    numCorrect++;
  }
}

function startNextRound() {
  if (currentRound == num_examples) {
	$("#correct").hide();
	$("#start").fadeIn(); 
    setTimeout(startHelper, 2000);
    return;
  }
  if (currentRound < num_examples) {
    loadExampleRound(currentRound+1);
    return;
  }
  if (currentRound == num_trials+100) {
    showScoreScreen();
    return;
  }
  loadTrialRound(currentRound-99);
}

function startHelper() {
	loadTrialRound(1);
}

function showScoreScreen() {
  $(".beginRoundHide").fadeOut();
  $("#question").fadeOut();
  $("#answer").fadeOut(showScoreScreenHelper);  
}

function showScoreScreenHelper() {
  var fraction_correct = Math.ceil(100*numCorrect/num_trials);
  var ave_response_time = Math.floor(totalReactionTime/num_trials);
  
  if (ave_response_time < 0) {
    alert(totalReactionTime+" "+num_trials);
  }
  
  $("#percent_correct").html(fraction_correct+"%");
  $("#ave_response").html(ave_response_time);
  $("#score_screen").fadeIn();
}

function finish()
{
  	REQUEST_CONSENT = false;
	experimentComplete(false);
}