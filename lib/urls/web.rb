require 'urls/runner'

module Urls
  module Web
    VERSION = '0.1.0'
  end

  class Runner
    desc "Start web server"
    def web
      Dir.chdir File.dirname(__FILE__) + '/../..'
      ENV['RACK_ENV'] ||= 'production'
      exec "bundle exec thin start -e #{ENV['RACK_ENV']}"
    end
  end
end
