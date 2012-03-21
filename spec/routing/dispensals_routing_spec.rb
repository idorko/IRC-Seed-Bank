require "spec_helper"

describe DispensalsController do
  describe "routing" do

    it "routes to #index" do
      get("/dispensals").should route_to("dispensals#index")
    end

    it "routes to #new" do
      get("/dispensals/new").should route_to("dispensals#new")
    end

    it "routes to #show" do
      get("/dispensals/1").should route_to("dispensals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dispensals/1/edit").should route_to("dispensals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dispensals").should route_to("dispensals#create")
    end

    it "routes to #update" do
      put("/dispensals/1").should route_to("dispensals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dispensals/1").should route_to("dispensals#destroy", :id => "1")
    end

  end
end
