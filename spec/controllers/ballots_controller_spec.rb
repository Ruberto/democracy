require 'rails_helper'

RSpec.describe BallotsController, :type => :controller do
  describe "POST create" do
    let(:topic) { create(:topic) }


    describe "with valid params" do
      it "creates a new Ballot" do
        expect {
          post :create, {:ballot => {name: 'bob', topic_ids: [topic.id, topic.id, topic.id]}}
        }.to change(Ballot, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ballot as @ballot" do
        post :create, {ballot: {name: nil}}
        expect(response.status).to eq(422)
      end

    end
  end
end
