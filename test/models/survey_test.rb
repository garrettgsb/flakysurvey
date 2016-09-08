require 'test_helper'

class SurveyTest < ActiveSupport::TestCase

## Let's start with an easy win.
  test "the truth" do
    assert true
  end

#----------------
#SURVEY TESTS
#----------------

#Survey creation
  test "Survey cannot be saved without user ID" do
    orphanSurvey = Survey.new(:user_id => nil)
    assert_not orphanSurvey.save
  end

  test "Survey cannot be saved without title." do
    user = User.new(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    invisibleSurvey = Survey.new(:user_id => User.last.id, :title => nil)
    assert_not invisibleSurvey.save
  end

  test "Survey with user ID and title saves successfully" do
    user = User.new(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    user.save
    normalSurvey = Survey.new(:user_id => user.id, :title => "What are a few of your favorite things?")
    assert normalSurvey.save
  end

  test "User can create a survey" do
    user = User.new(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    user.save
    assert user.surveys.create
  end

#----------------
#QUESTION TESTS
#----------------

  test "Question cannot be created without survey" do
    orphanQuestion = Question.new(:prompt => "What is the Matrix?")
    assert_not orphanQuestion.save
  end

  test "Question cannot be created under unsaved survey" do
    orphanSurvey = Survey.new(:user_id => nil)
    question = orphanSurvey.questions.new
    assert_not question.save
  end

  test "If survey belongs to a user but is NOT saved, that's a problem." do
    user = User.create(user_params)
    survey = user.surveys.new(survey_params)
    question = survey.questions.new(question_params)
    assert_not question.save
  end

  test "If survey belongs to a user and is saved, create all the questions you wish." do
    user = User.create(user_params)
    survey = user.surveys.new(survey_params)
    survey.save
    question = survey.questions.new(question_params)
    assert question.save
  end
end
