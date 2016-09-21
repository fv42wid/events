require 'test_helper'

class NewEventTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "new event page" do
    get new_event_path
    assert_template 'events/new'
    assert_select 'form input[name=?]', 'event[name]'
  end
end
