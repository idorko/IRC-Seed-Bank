require 'spec_helper'

describe "donations/edit" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation,
      :family => "MyString",
      :variety => "MyString",
      :quantity => 1
    ))
  end

  it "renders the edit donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => donations_path(@donation), :method => "post" do
      assert_select "input#donation_family", :name => "donation[family]"
      assert_select "input#donation_variety", :name => "donation[variety]"
      assert_select "input#donation_quantity", :name => "donation[quantity]"
    end
  end
end
