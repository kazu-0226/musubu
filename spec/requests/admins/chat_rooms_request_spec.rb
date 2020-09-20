require 'rails_helper'

RSpec.describe "Admins::ChatRooms", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/chat_rooms/index"
      expect(response).to have_http_status(:success)
    end
  end

end
