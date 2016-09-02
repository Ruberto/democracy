require 'rails_helper'

RSpec.describe "ballots/new", :type => :view do
  before(:each) do
    assign(:ballot, Ballot.new(
      :ip_address => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new ballot form" do
    render

    assert_select "form[action=?][method=?]", ballots_path, "post" do

      assert_select "input#ballot_ip_address[name=?]", "ballot[ip_address]"

      assert_select "input#ballot_name[name=?]", "ballot[name]"
    end
  end
end
