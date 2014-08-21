require "spec_helper"

describe BookPreferencesController do
  describe "routing" do

    it "routes to #index" do
      get("/book_preferences").should route_to("book_preferences#index")
    end

    it "routes to #new" do
      get("/book_preferences/new").should route_to("book_preferences#new")
    end

    it "routes to #show" do
      get("/book_preferences/1").should route_to("book_preferences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/book_preferences/1/edit").should route_to("book_preferences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/book_preferences").should route_to("book_preferences#create")
    end

    it "routes to #update" do
      put("/book_preferences/1").should route_to("book_preferences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/book_preferences/1").should route_to("book_preferences#destroy", :id => "1")
    end

  end
end
