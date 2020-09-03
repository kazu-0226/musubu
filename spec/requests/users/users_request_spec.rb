require 'rails_helper'

RSpec.describe "Users::Users", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/users/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
