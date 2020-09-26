require 'rails_helper'

RSpec.describe "Shops", type: :request do

  describe "GET /mypage" do
    it "returns http success" do
      get "/shops/shops/mypage"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/shops/shops/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
