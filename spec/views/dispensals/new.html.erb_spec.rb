require 'spec_helper'

describe "dispensals/new" do
  before(:each) do
    assign(:dispensal, stub_model(Dispensal,
      :family => "MyString",
      :variety => "MyString",
      :quantity => 1
    ).as_new_record)
  end

  it "renders new dispensal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dispensals_path, :method => "post" do
      assert_select "input#dispensal_family", :name => "dispensal[family]"
      assert_select "input#dispensal_variety", :name => "dispensal[variety]"
      assert_select "input#dispensal_quantity", :name => "dispensal[quantity]"
    end
  end
end
