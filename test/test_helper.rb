ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def user_params
    return {:username => "Dave", :password => "12345678", :password_confirmation => "12345678"}
  end

  def survey_params
    return {:title => "Test Survey!"}
  end

  def question_params
    return { :prompt => "Why is there something instead of nothing?", :question_type => "single" }
  end

  def choice_params
    return { :text => "When all you have is a hammer, everything looks like a nail.", :order_id => 1 }
  end

end
