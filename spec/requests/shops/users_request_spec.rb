require 'rails_helper'

RSpec.describe "Shops::Users", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/shops/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/shops/users/show"
      expect(response).to have_http_status(:success)
    end
  end

end
