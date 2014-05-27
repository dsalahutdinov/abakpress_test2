require 'spec_helper'

describe "WikiPosts" do
  describe "GET /" do
    it "root page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/"
      response.status.should be(200)
    end
  end
end
