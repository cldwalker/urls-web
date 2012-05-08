require 'bundler'
Bundler.require(:default, (ENV['RACK_ENV'] || :development).to_sym)
Urls.setup

module My
  class Application < Sinatra::Base
    get '/' do
      @urls = Url.last(10)
      haml :index
    end
  end
end
