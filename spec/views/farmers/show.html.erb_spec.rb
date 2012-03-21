require 'spec_helper'

describe "farmers/show" do
  before(:each) do
    @farmer = assign(:farmer, stub_model(Farmer,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
