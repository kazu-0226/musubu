require 'rails_helper'

RSpec.describe "Admins::News", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/news/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /form" do
    it "returns http success" do
      get "/admins/news/form"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/admins/news/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /completed" do
    it "returns http success" do
      get "/admins/news/completed"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/news/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/news/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
