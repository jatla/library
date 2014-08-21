require "spec_helper"

describe UserConfigsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_configs").should route_to("user_configs#index")
    end

    it "routes to #new" do
      get("/user_configs/new").should route_to("user_configs#new")
    end

    it "routes to #show" do
      get("/user_configs/1").should route_to("user_configs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_configs/1/edit").should route_to("user_configs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_configs").should route_to("user_configs#create")
    end

    it "routes to #update" do
      put("/user_configs/1").should route_to("user_configs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_configs/1").should route_to("user_configs#destroy", :id => "1")
    end

  end
end
