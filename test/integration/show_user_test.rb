require 'test_helper'

class ShowUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @frank = users(:frank)
    @joe = users(:joe)
    @joes_event = @joe.events.new(name: "Joe's", location: "home", date: "2016-10-10")
    @joes_event.save
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

  test "should display events user is attending" do
    @frank_attending = @frank.attended_events.new(event_id: @joes_event.id)
    @frank_attending.save
    get user_path(@frank)
    assert_select "li>h3", "Joe's"
  end
end
