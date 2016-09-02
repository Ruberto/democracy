require 'rails_helper'

RSpec.describe ResultsController, :type => :controller do

  describe "GET index" do
    before do
      3.times { create(:topic) }
      create(:ballot, ip_address: "192.168.0.1", topic_ids: [Topic.second.id,Topic.first.id,Topic.last.id])
      create(:ballot, ip_address: "192.168.0.3", topic_ids: [Topic.second.id,Topic.last.id,Topic.first.id])
      create(:ballot, ip_address: "192.168.0.2", topic_ids: [Topic.first.id,Topic.first.id,Topic.first.id])

    end

    it "should return a list of results" do
      get :index
      expect(JSON.parse(response.body).count).to eq 3
    end

    it "should return a list of results" do
      get :index
      expect(JSON.parse(response.body).all? { |result| result["count"].present? }).to be_truthy
    end

    it "should return the correct keys" do
      get :index
      expect(JSON.parse(response.body).first.keys).to eq(["id", "name", "description","author", "count"])
    end
  end

end
