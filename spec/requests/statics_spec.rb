require 'rails_helper'

RSpec.describe "Statics", :type => :request do
  describe "GET /statics" do
    it "works! (now write some real specs)" do
      get statics_path
      expect(response.status).to be(200)
    end
  end
end
