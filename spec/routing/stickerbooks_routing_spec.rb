require "rails_helper"

RSpec.describe StickerbooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stickerbooks").to route_to("stickerbooks#index")
    end

    it "routes to #show" do
      expect(get: "/stickerbooks/1").to route_to("stickerbooks#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stickerbooks").to route_to("stickerbooks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stickerbooks/1").to route_to("stickerbooks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stickerbooks/1").to route_to("stickerbooks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stickerbooks/1").to route_to("stickerbooks#destroy", id: "1")
    end
  end
end
