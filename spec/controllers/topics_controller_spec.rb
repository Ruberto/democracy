require 'rails_helper'

RSpec.describe TopicsController, :type => :controller do

  describe "GET index" do
    before do
      create(:topic)
      create(:topic, :closed)
    end

    it "returns all open topics" do
      get :index
      expect(JSON.parse(response.body).length).to eq 1
      expect(JSON.parse(response.body).first["state"]).to eq "open"
    end
  end

  describe "GET show" do
    context "with a valid topic id" do
      let(:topic) { create(:topic) }
      it "returns the requested open topic as @topic" do
        get :show, { id: topic.id }
        expect(JSON.parse(response.body)["id"]).to eq topic.id
      end
    end

    context "when a topic is not found" do
      it "should return not found" do
         get :show, { id: -10 }
        expect(response.status).to eq 404
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:create_topic) { post :create, { topic: { name: "name", author: "cool author" } } }
      it "creates a new Topic" do
        expect{ create_topic }.to change(Topic, :count).by(1)
      end

      it "returns a new Topic object" do
        create_topic
        expect(JSON.parse(response.body)["author"]).to eq "cool author"
      end
    end

    describe "with invalid params" do
      let(:create_topic) { post :create, { topic: { name: "", author: "" } } }
      it "returns unprocessible entity" do
        create_topic
        expect(response.status).to eq 422
      end

      it "returns the topic errors" do
        create_topic
        expect(JSON.parse(response.body).keys).to eq ["name", "author"]
      end
    end
  end

  describe "DELETE destroy" do
    context "a valid open topic" do
      let(:topic) { create(:topic) }
      let(:delete_topic) { delete :destroy, { id: topic.id } }

      it "destroys marks the requested topic as closed" do
        delete_topic
        expect(response.status).to eq 204
      end
    end

    context "a topic that was not found" do
      let(:delete_topic) { delete :destroy, { id: -1 } }

      it "destroys marks the requested topic as closed" do
        delete_topic
        expect(response.status).to eq 404
      end
    end
  end

end
