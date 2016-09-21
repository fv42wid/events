require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup info" do
    get new_user_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, params: {user: {name: "Frank", email: "frank@test.com", password: "wrong", password_confirmation: "password"} }
    end
    assert_template 'users/new'
    assert_select 'a[href=?]', sessions_new_path
  end

  test "valid signup info" do
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "Frank", email: "frank@test.com", password: "password", password_confirmation: "password"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_select 'a[href=?]', user_path
    assert_select 'h1', 'Frank'
    assert_select 'p', 'frank@test.com'
  end
end
