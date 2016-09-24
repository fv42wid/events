require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @frank = users(:frank)
    @event = events(:one)
  end

  test "should get new" do
    get new_event_path
    assert_response :success
  end

  test "should get show" do
    get event_path(@event)
    assert_response :success
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

  test "create should redirect when not logged in" do
    assert_no_difference 'Event.count' do
      post events_path, params: {event: {name: "Event1", location: "Home"} }
    end
    assert_redirected_to login_path
  end

  test "valid event creation" do
    log_in_as(users(:frank))
    assert_difference 'Event.count', 1 do
      post events_path, params: {event: {name: "Event1", location: "Home"} }
    end
  end

end
