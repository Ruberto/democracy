require 'rails_helper'

RSpec.describe "ballots/edit", :type => :view do
  before(:each) do
    @ballot = assign(:ballot, Ballot.create!(
      :ip_address => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit ballot form" do
    render

    assert_select "form[action=?][method=?]", ballot_path(@ballot), "post" do

      assert_select "input#ballot_ip_address[name=?]", "ballot[ip_address]"

      assert_select "input#ballot_name[name=?]", "ballot[name]"
    end
  end
end
