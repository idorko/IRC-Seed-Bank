require 'spec_helper'

describe "donations/new" do
  before(:each) do
    assign(:donation, stub_model(Donation,
      :family => "MyString",
      :variety => "MyString",
      :quantity => 1
    ).as_new_record)
  end

  it "renders new donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => donations_path, :method => "post" do
      assert_select "input#donation_family", :name => "donation[family]"
      assert_select "input#donation_variety", :name => "donation[variety]"
      assert_select "input#donation_quantity", :name => "donation[quantity]"
    end
  end
end
