ENV["RACK_ENV"] = "test"
ENV['URLS_HOME'] = File.dirname(__FILE__) + '/.urls'
ENV['URLS_RC'] = ''
ENV['TAG_HOME'] = File.dirname(__FILE__) + '/.tag'

require File.dirname(__FILE__) + "/../application"
require 'capybara/rspec'
require 'capybara/dsl'

RSpec.configure do |c|
  c.include Capybara::DSL
end

Capybara.app = My::Application

at_exit do
  FileUtils.rm_rf(ENV['URLS_HOME'])
  FileUtils.rm_rf(ENV['TAG_HOME'])
end
