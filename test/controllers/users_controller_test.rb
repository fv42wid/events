require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @frank = users(:frank)
  end

  test "should get new" do
    get new_user_path
    assert_response :success
    assert_template 'users/new'
    assert_select 'form input[type=submit][value="Create Account"]'
  end

  test "should get show" do
    get user_path(@frank)
    assert_response :success
    assert_template 'users/show'
    assert_select 'h1', "Frank"
  end

end
