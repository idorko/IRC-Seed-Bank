require 'spec_helper'

describe "farmers/edit" do
  before(:each) do
    @farmer = assign(:farmer, stub_model(Farmer,
      :name => "MyString"
    ))
  end

  it "renders the edit farmer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => farmers_path(@farmer), :method => "post" do
      assert_select "input#farmer_name", :name => "farmer[name]"
    end
  end
end
