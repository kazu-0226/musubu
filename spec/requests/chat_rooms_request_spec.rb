require 'rails_helper'

RSpec.describe "ChatRooms", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/chat_rooms/show"
      expect(response).to have_http_status(:success)
    end
  end

end
