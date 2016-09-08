require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase

  setup do
    @user = User.create(user_params)
    @survey = @user.surveys.create(survey_params)
    @question = @survey.questions.create(question_params)
  end

## Let's start with an easy win.
  test "the truth" do
    assert true
  end

  test "User, Survey and Question exist in testing context" do
    assert @user && @survey && @question
  end
#----------------
#QUESTION TESTS
#----------------

  test "We all gotta make choices." do
    choice = @question.choices.new(choice_params)
    assert choice.save
  end

  test "No orphan choices" do
    choice = Choice.new(choice_params)
    assert_not choice.save
  end

  test "Question can have multiple choices." do
    choice_1 = @question.choices.create(:text => "Yes", :order_id => 1)
    choice_2 = @question.choices.create(:text => "No", :order_id => 2)
    choice_3 = @question.choices.create(:text => "Maybe", :order_id => 3)
    assert @question.choices.length == 3
  end

end
