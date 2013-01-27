require "spec_helper"

describe IndexController do
  describe "routing" do

    it "routes to #home" do
      get("/").should route_to("index#home")
    end

  end
end
