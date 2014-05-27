require "spec_helper"

describe WikiPostsController do
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("wiki_posts#index")
    end

    it "routes to #new" do
      get("/add").should route_to("wiki_posts#new")
      get("/sdfsdf/add").should route_to("wiki_posts#new", :ids => "sdfsdf")
    end

    it "routes to #show" do
      get("/sadaesf").should route_to("wiki_posts#show", :ids => "sadaesf")
      get("/sadaesf/sdfsdfsdf").should route_to("wiki_posts#show", :ids => "sadaesf/sdfsdfsdf")
    end

    it "routes to #edit" do
      get("/sdfsdfsdf/edit").should route_to("wiki_posts#edit", :ids => "sdfsdfsdf")
    end

    it "routes to #create" do
      post("/create").should route_to("wiki_posts#create")
      post("/adsfasdfasdf/create").should route_to("wiki_posts#create", :ids => "adsfasdfasdf")
    end

    it "routes to #update" do
      put("/asdfasd").should route_to("wiki_posts#update", :ids => "asdfasd")
    end
  end
end
