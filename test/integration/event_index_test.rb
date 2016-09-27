require 'test_helper'

class EventIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @old_event = events(:old)
    @new_event = events(:upcoming)
  end

  test "event index should separate previous and upcoming events" do
    get events_path
    assert_template 'events/index'
    assert_select "ul#upcoming-events>li:match('id', ?)", "event-#{@new_event.id}"
    assert_select "ul#previous-events>li:match('id', ?)", "event-#{@old_event.id}"
  end
end
