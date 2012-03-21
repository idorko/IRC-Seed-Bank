require 'spec_helper'

describe "seeds/edit" do
  before(:each) do
    @seed = assign(:seed, stub_model(Seed,
      :family => "MyString",
      :variety => "MyString",
      :quantity => 1
    ))
  end

  it "renders the edit seed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seeds_path(@seed), :method => "post" do
      assert_select "input#seed_family", :name => "seed[family]"
      assert_select "input#seed_variety", :name => "seed[variety]"
      assert_select "input#seed_quantity", :name => "seed[quantity]"
    end
  end
end
