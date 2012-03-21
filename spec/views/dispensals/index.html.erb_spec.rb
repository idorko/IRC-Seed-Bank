require 'spec_helper'

describe "dispensals/index" do
  before(:each) do
    assign(:dispensals, [
      stub_model(Dispensal,
        :family => "Family",
        :variety => "Variety",
        :quantity => 1
      ),
      stub_model(Dispensal,
        :family => "Family",
        :variety => "Variety",
        :quantity => 1
      )
    ])
  end

  it "renders a list of dispensals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Variety".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
