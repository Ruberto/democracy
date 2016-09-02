require 'rails_helper'

RSpec.describe "ballots/index", :type => :view do
  before(:each) do
    assign(:ballots, [
      Ballot.create!(
        :ip_address => "Ip Address",
        :name => "Name"
      ),
      Ballot.create!(
        :ip_address => "Ip Address",
        :name => "Name"
      )
    ])
  end

  it "renders a list of ballots" do
    render
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
