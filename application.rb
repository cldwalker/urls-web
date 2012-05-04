require 'bundler'
Bundler.require(:default, (ENV['RACK_ENV'] || :development).to_sym)
require 'ostruct'

module My
  class Application < Sinatra::Base
    get '/' do
      @urls = [
        ['http://funnyordie.com', 'some site'], ['http://github.com', 'HUB']
      ].map {|e| OpenStruct.new(name: e[0], description: e[1]) }
      haml :index
    end
  end
end
