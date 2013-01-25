require "spec_helper"

describe AntibodiesController do
  describe "routing" do

    it "routes to #index" do
      get("/antibodies").should route_to("antibodies#index")
    end

    it "routes to #new" do
      get("/antibodies/new").should route_to("antibodies#new")
    end

    it "routes to #show" do
      get("/antibodies/1").should route_to("antibodies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/antibodies/1/edit").should route_to("antibodies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/antibodies").should route_to("antibodies#create")
    end

    it "routes to #update" do
      put("/antibodies/1").should route_to("antibodies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/antibodies/1").should route_to("antibodies#destroy", :id => "1")
    end

  end
end
