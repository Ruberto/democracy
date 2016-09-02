require 'rails_helper'

RSpec.describe "ballots/show", :type => :view do
  before(:each) do
    @ballot = assign(:ballot, Ballot.create!(
      :ip_address => "Ip Address",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ip Address/)
    expect(rendered).to match(/Name/)
  end
end
