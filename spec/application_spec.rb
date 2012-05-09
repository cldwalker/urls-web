require 'spec_helper'

describe My::Application do
  describe "GET /" do
    it "retrieves page successfully" do
      visit '/'
      within('h2') { page.should have_content 'Last 10 Urls' }
      page.status_code.should == 200
    end

    it "sees a table with the correct rows" do
      urls = [['http://funnyordie.com', 'some site', 'funny, celebrity'], ['http://github.com', 'HUB', 'code']]
      urls.each do|arr|
        Url.create name: arr[0], desc: arr[1]
        Urls.add_tag arr[0], arr[2].sub(/\s*,\s*/, ',')
      end
      visit '/'

      page.should have_table('last_urls', :rows => urls.reverse)
    end
  end
end
