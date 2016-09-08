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

        //Set up input fields to be passed as question params when form is posted
        $(container).load("/questions #text", function(){
          var thisQuestion = `#question-${questionCount}`
          $(thisQuestion).find(".question-type").first().attr("name",`questions[question-${questionCount}][question_type]`);
          $(thisQuestion).find(".question-prompt").first().attr("name",`questions[question-${questionCount}][prompt]`);
          $(thisQuestion).find(".question-placeholder").first().attr("name",`questions[question-${questionCount}][placeholder]`);
          questionCount += 1;
        });
        $("#add-question").css('visibility','visible');

      });
      $("#choose-single").on('click', function(){
        var container = $(this).parents()[1];

        //TODO: Set params for this question type
        $(container).load("/questions #single", function(){
          var thisQuestion = `#question-${questionCount}`
          $(thisQuestion).find(".question-type").first().attr("name",`questions[question-${questionCount}][question_type]`);
          $(thisQuestion).find(".question-prompt").first().attr("name",`questions[question-${questionCount}][prompt]`);
          $(thisQuestion).find(".radio-label").each(function(){ $(this).attr("name",`questions[question-${questionCount}][choice][]`) });
          questionCount += 1;
        });
        $("#add-question").css('visibility','visible');
      });
      $("#choose-multi").on('click', function(){
        var container = $(this).parents()[1];

        //TODO: Set params for this question type
        $(container).load("/questions #multi", function() {
          var thisQuestion = `#question-${questionCount}`
          $(thisQuestion).find(".question-type").first().attr("name",`questions[question-${questionCount}][question_type]`);
          $(thisQuestion).find(".question-prompt").first().attr("name",`questions[question-${questionCount}][prompt]`);
          $(thisQuestion).find(".checkbox-label").each(function(){ $(this).attr("name",`questions[question-${questionCount}][choice][]`) });
          questionCount += 1;
        });
        $("#add-question").css('visibility','visible');
      });
    });
    $(`#question-${questionCount}`).before(`<h2>Question ${questionCount}</h2>`);
  });
});
