class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attendees, class_name: "AttendedEvent", source: :user

end
