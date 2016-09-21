require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Frank", email: "frank@test.com", password: "test", password_confirmation: "test")
    @invalid_user = User.new(name: "Frank", email: "frank@test.com", password: "test", password_confirmation: "wrong")
  end

  test "valid signup" do
    assert @user.valid?
  end

  test "password mismatch signup" do
    assert_not @invalid_user.valid?
  end
end
