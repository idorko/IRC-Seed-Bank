require 'spec_helper'

describe "dispensals/show" do
  before(:each) do
    @dispensal = assign(:dispensal, stub_model(Dispensal,
      :family => "Family",
      :variety => "Variety",
      :quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Variety/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
