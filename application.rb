require 'bundler'
Bundler.require(:default, (ENV['RACK_ENV'] || :development).to_sym)
Urls.setup
require 'json'

module My
  class Application < Sinatra::Base
    get '/' do
      @urls = Url.last(10)
      haml :index
    end

    get '/tag/:tag' do
      @tag = params[:tag]
      @urls = Url.tagged_with(params[:tag])
      haml :tag
    end

    get '/url_search.json' do
      JSON.dump [{name: "http://news.ycombinator.com", desc: 'time sink', tags: 'dumb'},
                 {name: "google.com", desc: 'useful', tags: 'search'}]
    end
  end
end
