require "rails_helper"

RSpec.describe GathersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gathers").to route_to("gathers#index")
    end

    it "routes to #show" do
      expect(get: "/gathers/1").to route_to("gathers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gathers").to route_to("gathers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gathers/1").to route_to("gathers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gathers/1").to route_to("gathers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gathers/1").to route_to("gathers#destroy", id: "1")
    end
  end
end
