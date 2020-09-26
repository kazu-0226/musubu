require 'rails_helper'

RSpec.describe "Shops", type: :request do

  # describe "GET /mypage" do
  #   it "returns http success" do
  #     get "/shops/shops/mypage"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/shops/shops/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'お店新規登録' do
    before do
      visit new_shop_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'shop[email]', with: Faker::Internet.email
        fill_in 'shop[password]', with: 'password'
        fill_in 'shop[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content '編集'
      end
      it '新規登録に失敗する' do
        fill_in 'shop[email]', with: ''
        fill_in 'shop[password]', with: ''
        fill_in 'shop[password_confirmation]', with: ''
        click_button '新規登録'

        expect(page).to have_content '新規登録'
      end
    end
  end

  describe 'お店ログイン' do
    let(:shop) { create(:shop) }
    before do
      visit new_shop_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_shop) { shop }
      it 'ログインに成功する' do
        fill_in 'shop[email]', with: test_shop.email
        fill_in 'shop[password]', with: test_shop.password
        click_button 'ログイン'

        expect(page).to have_content '編集'
      end

      it 'ログインに失敗する' do
        fill_in 'shop[email]', with: ''
        fill_in 'shop[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_shop_session_path)
      end
    end
  end

end
