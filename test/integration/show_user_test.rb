require 'test_helper'

class ShowUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @frank = users(:frank)
  end

  test "should display users and events" do
    get user_path(@frank)
    assert_template 'users/show'
    assert_select 'h1', 'Frank'
    assert_select 'p', 'frank@test.com'
    @frank.events.each do |event|
      assert_match event.name, response.body
    end
  end
end
