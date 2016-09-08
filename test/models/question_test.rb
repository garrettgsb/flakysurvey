require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  setup do
    @user = User.create(user_params)
    @survey = @user.surveys.create(survey_params)
  end

## Let's start with an easy win.
  test "the truth" do
    assert true
  end

  test "User and Survey exist in testing context" do
    assert @user && @survey
  end

#----------------
#QUESTION TESTS
#----------------
  test "Questions can be created and saved" do
    assert @user.surveys.first.questions.create(question_params)
  end

  test "Questions without prompts are not saved" do
    question = @survey.questions.new(:question_type => "text")
    assert_not question.save
  end

  test "Questions without types are not saved" do
    question = @survey.questions.new(:prompt => "Which part of cow contains greatest proteins?")
    assert_not question.save
  end
end
