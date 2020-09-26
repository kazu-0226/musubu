require 'rails_helper'

RSpec.describe "Users", type: :request do
  let (:id) { '1' }
  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/users/users/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/users/users/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

    describe 'マイページ' do
      context "マイページが正しく表示される" do
        before do 
          get user_path(id)
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end

end
