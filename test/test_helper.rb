ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #log in as a user
  def log_in_as(user)
    post login_path, params: {session: {email: user.email} }
  end
end

class ActionDispatch::IntegrationTest

  #integration test login
  def log_in_as(user)
    post login_path, params: {session: {email: "frank@test.com"} }
  end
end
