require "spec_helper"

describe FarmersController do
  describe "routing" do

    it "routes to #index" do
      get("/farmers").should route_to("farmers#index")
    end

    it "routes to #new" do
      get("/farmers/new").should route_to("farmers#new")
    end

    it "routes to #show" do
      get("/farmers/1").should route_to("farmers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/farmers/1/edit").should route_to("farmers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/farmers").should route_to("farmers#create")
    end

    it "routes to #update" do
      put("/farmers/1").should route_to("farmers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/farmers/1").should route_to("farmers#destroy", :id => "1")
    end

  end
end
