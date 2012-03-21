require 'spec_helper'

describe "dispensals/edit" do
  before(:each) do
    @dispensal = assign(:dispensal, stub_model(Dispensal,
      :family => "MyString",
      :variety => "MyString",
      :quantity => 1
    ))
  end

  it "renders the edit dispensal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dispensals_path(@dispensal), :method => "post" do
      assert_select "input#dispensal_family", :name => "dispensal[family]"
      assert_select "input#dispensal_variety", :name => "dispensal[variety]"
      assert_select "input#dispensal_quantity", :name => "dispensal[quantity]"
    end
  end
end
