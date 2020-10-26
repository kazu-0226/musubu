require 'rails_helper'

RSpec.describe "Admins::AutoMailDeliveries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/auto_mail_deliveries/index"
      expect(response).to have_http_status(:success)
    end
  end

end
