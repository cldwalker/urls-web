require 'spec_helper'

describe My::Application do
  describe "GET /" do
    it "retrieves page successfully" do
      visit '/'
      within('h2') { page.should have_content 'Last 10 Urls' }
      page.status_code.should == 200
    end

    it "sees a table with the correct rows" do
      visit '/'
      page.should have_table('last_urls', :rows => [
        ['http://funnyordie.com', 'some site'], ['http://github.com', 'HUB']
      ])
    end
  end
end
