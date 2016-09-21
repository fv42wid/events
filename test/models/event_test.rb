require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @frank = users(:frank)
  end

  test "create valid event" do
    @event = @frank.events.new(name: "Big Event", location: "Home")
    assert @event.valid?
  end
end
