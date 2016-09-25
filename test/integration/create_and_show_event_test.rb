require 'test_helper'

class CreateAndShowEventTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def set
    @frank = users(:frank)
  end

  test "create and display event" do
    log_in_as(@frank)
    event = {name: "Event1", location: "Home"}
    get new_event_path
    assert_select 'form.new_event'
    assert_difference 'Event.count', 1 do
      post events_path, params: {event: event}
    end
    follow_redirect!
    assert_template 'events/show'
    assert_match event[:name], response.body
  end
end
