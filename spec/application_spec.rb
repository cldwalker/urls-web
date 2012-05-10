require 'spec_helper'

describe My::Application do
  def create_urls(urls)
    urls.each do|arr|
      Url.create name: arr[0], desc: arr[1]
      Urls.add_tag arr[0], arr[2].sub(/\s*,\s*/, ',')
    end
  end

  describe "GET /" do
    it "retrieves page successfully" do
      visit '/'
      within('h2') { page.should have_content 'Last 10 Urls' }
      page.status_code.should == 200
    end

    it "displays a table with the correct rows" do
      urls = [['http://funnyordie.com', 'some site', 'funny, celebrity'],
        ['http://github.com', 'HUB', 'code']]
      create_urls urls
      visit '/'

      page.should have_table('last_urls', :rows => urls.reverse)
    end
  end

  describe "GET /tag/:tag" do
    it "displays a table with the correct rows" do
      urls = [["http://google.com", '', 'search'], ['http://yahoo.com', '', 'search'],
        ['http://amazon.com', '', 'buy']]
      create_urls urls
      visit '/tag/search'

      page.should have_table('tagged_urls', :rows => urls[0,2])
    end
  end
end
