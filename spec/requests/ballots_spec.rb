require 'rails_helper'

RSpec.describe "Ballots", :type => :request do
  describe "GET /ballots" do
    it "works! (now write some real specs)" do
      get ballots_path
      expect(response).to have_http_status(200)
    end
  end
end
