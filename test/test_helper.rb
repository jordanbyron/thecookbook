ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

DatabaseCleaner.clean_with :truncation

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
end

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end
