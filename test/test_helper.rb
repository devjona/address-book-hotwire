ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'helpers/test_password_helper'
require 'helpers/sign_in_helper'

class ActiveSupport::TestCase
  # These 'include' are for the tests
  include TestPasswordHelper
  include SignInHelper

  # These 'include' are for the fixtures
  ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
