require 'test_helper'

class UserTest < ActiveSupport::TestCase

## Let's start with an easy win.
  test "the truth" do
    assert true
  end

#----------------
#USER SIGNUP TESTS
#----------------

#Username tests
  test "New user does not save if username not present" do
    user = User.new(:password => "weareanonymous", :password_confirmation => "weareanonymous")
    assert_not user.save
  end

  test "New user cannot use existing username" do
    user = User.new(
      :username => "Dave",
      :password => "12345678",
      :password_confirmation => "12345678")
    user.save
    next_user = User.new(
      :username => "Dave",
      :password => "michaelangelo",
      :password_confirmation => "michaelangelo")
    assert_not next_user.save
  end

#Password tests
  test "User creation fails if no password provided" do
    user = User.new(:username => "Dave", :password_confirmation => "waityoumissedsomething")
    assert_not user.save
  end

  test "User creation fails if password_confirmation not provided" do
    user = User.new(
      :username => "Dave",
      :password => "12345678")
    assert_not user.save
  end


  test "User creation fails if password and confirmation don't match" do
    user = User.new(
      :username => "Dave",
      :password => "12345678",
      :password_confirmation => "87654321")
    assert_not user.save
  end

  test "Password must be at least 6 characters long" do
    user = User.new(
      :username => "Dave",
      :password => "12345",
      :password_confirmation => "12345")
    assert_not user.save
  end

# Affirmative tests

  #TODO: Modify this test when password encryption is enabled
  test "User creation stores password to database" do
    user = User.new(:username => "Dave", :password => "12345678", :password_confirmation => "12345678")
    user.save
    assert_not_nil User.last.password == "12345678"
  end

  test "New user does save to database" do
    user = User.new(:username => "Sam", :password => "12345678", :password_confirmation => "12345678")
    user.save
    assert User.last.username == "Sam"
  end

end
