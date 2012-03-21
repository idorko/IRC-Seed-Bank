require 'spec_helper'

describe "seeds/show" do
  before(:each) do
    @seed = assign(:seed, stub_model(Seed,
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
