require 'spec_helper'

describe "farmers/new" do
  before(:each) do
    assign(:farmer, stub_model(Farmer,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new farmer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => farmers_path, :method => "post" do
      assert_select "input#farmer_name", :name => "farmer[name]"
    end
  end
end
