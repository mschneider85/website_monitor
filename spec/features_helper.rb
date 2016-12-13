# Require this file for feature tests
require_relative './spec_helper'

require 'minitest/reporters'
Minitest::Reporters.use!
require 'capybara'
require 'capybara/dsl'

Capybara.app = Hanami.app

class MiniTest::Spec
  include Capybara::DSL
end
