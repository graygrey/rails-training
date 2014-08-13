require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "Home page" do
    it "should have the content 'Rails-Training'" do
      visit "/static_pages/home"
      expect(page).to have_content("Rails-Training")
    end
  end
end
