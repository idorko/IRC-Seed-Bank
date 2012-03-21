require 'spec_helper'

describe "farmers/index" do
  before(:each) do
    assign(:farmers, [
      stub_model(Farmer,
        :name => "Name"
      ),
      stub_model(Farmer,
        :name => "Name"
      )
    ])
  end

  it "renders a list of farmers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
