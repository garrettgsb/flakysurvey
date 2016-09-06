$(document).ready(function(){
  var questionCount = 1;
  var textQuestion = null;
  console.log("Yep, this is loading.");

  //"Add Question" button
  $("#add-question").on('click', function() {

    //Add div for question to live in with sequential question ID, hide "New question" button
    $("#add-question").before(`<div class="question-area" id="question-${questionCount}">`);
    $("#add-question").css('visibility','hidden');

    //Add Question > What type of question is this?
    //TODO: DRY out click handlers
    $(`#question-${questionCount}`).load('/questions #choose', function(){
      $("#choose-text").on('click', function(){
        var container = $(this).parents()[1];
        $(container).load("/questions #text");
        $("#add-question").css('visibility','visible');
      });
      $("#choose-single").on('click', function(){
        var container = $(this).parents()[1];
        $(container).load("/questions #single");
        $("#add-question").css('visibility','visible');
      });
      $("#choose-multi").on('click', function(){
        var container = $(this).parents()[1];
        $(container).load("/questions #multi");
        $("#add-question").css('visibility','visible');
      });
    });
    $(`#question-${questionCount}`).before(`<h2>Question ${questionCount}</h2>`);
    questionCount += 1;
  });
});
