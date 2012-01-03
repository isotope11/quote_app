require "minitest/autorun"
require "minitest/rails"

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'capybara/rails'

require File.expand_path('../support/factories', __FILE__)

# If description name ends with 'integration', use this RequestSpec class.
# It has all the integration test goodies.
class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL

  def login_as(email, password)
    page.driver.post user_session_path(user: { email: email, password: password })
  end
end

MiniTest::Spec.register_spec_type /integration$/i, RequestSpec

# Database cleaner.
DatabaseCleaner.strategy = :transaction
class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end
  after :each do
    DatabaseCleaner.clean
  end
end

