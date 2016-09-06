require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "Should get new" do
    get '/users/new'
    assert_response :success
  end

  test "Should create user" do
    post '/users', params: { user: { :username => "Dave", :password => "12345678", :password_confirmation => "12345678" } }
    assert User.last.username == "Dave"
  end

  test "Doesn't create user if username missing" do
    post '/users', params: { user: { :password => "24687531", :password_confirmation => "24687531" } }
    assert_not User.last.password == "24687531"
  end

  test "Doesn't create user if password missing" do
    post '/users', params: { user: { :username => "Trish", :password_confirmation => "12345678" } }
    assert_not User.last.username == "Trish"
  end

  test "Doesn't create user if password confirmation missing" do
    post '/users', params: { user: { :username => "Mavis", :password => "12345678" } }
    assert_not User.last.username == "Mavis"
  end


end
