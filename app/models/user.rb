class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :attended_events, foreign_key: "attendee_id"

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def previous_events
    self.attended_events.joins(:event).where("events.date < ?", DateTime.now)
  end

  def upcoming_events
    self.attended_events.joins(:event).where("events.date > ?", DateTime.now)
  end
end
