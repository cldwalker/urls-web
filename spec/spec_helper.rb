ENV["RACK_ENV"] = "test"

require File.dirname(__FILE__) + "/../application"
require 'capybara/rspec'
require 'capybara/dsl'

RSpec.configure do |c|
  c.include Capybara::DSL
end

Capybara.app = My::Application
