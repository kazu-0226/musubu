require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /top" do
    it "returns http success" do
      get "/homes/top"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/homes/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/homes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get "/homes/login"
      expect(response).to have_http_status(:success)
    end
  end

end
