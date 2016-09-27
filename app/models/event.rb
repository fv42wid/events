class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attendees, class_name: "AttendedEvent", source: :user

  scope :past, -> {where("date < ?", DateTime.now)}
  scope :upcoming, -> {where("date > ?", DateTime.now)}

#  def Event.past
#    Event.where("date < ?", DateTime.now)
#  end

#  def Event.upcoming
#    Event.where("date > ?", DateTime.now)
#  end

end
