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
  test "Survey cannot be created without user ID" do
    orphanSurvey = Survey.new(:user_id => nil)
    assert_not orphanSurvey.save
  end

  test "Survey with user ID saves successfully" do
    user = User.new(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    user.save
    normalSurvey = Survey.new(:user_id => user.id)
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
    user = User.create(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    survey = user.surveys.new
    question = survey.questions.new(:prompt => "Why are we here?")
    assert_not question.save
  end

  test "If survey belongs to a user and is saved, create all the questions you wish." do
    user = User.create(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    survey = user.surveys.new
    survey.save
    assert survey.questions.create(:prompt => "Why is there something instead of nothing?")
  end
end
