require 'rails_helper'

RSpec.describe "Inquiries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/inquiry/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/inquiry/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /thanks" do
    it "returns http success" do
      get "/inquiry/thanks"
      expect(response).to have_http_status(:success)
    end
  end

end
