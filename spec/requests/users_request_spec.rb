require 'rails_helper'

RSpec.describe "Users", type: :request do

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

  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content 'プロフィール編集'
      end
      it '新規登録に失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button '新規登録'

        expect(page).to have_content '会員新規登録'
      end
    end
  end

  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'ログイン'

        expect(page).to have_content 'プロフィール編集'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
  # describe 'ユーザーログイン' do
  #   let(:user) { create(:user) }
  #   user.is_deleted = "true"
  #   before do
  #     visit new_user_session_path
  #   end
  #   context 'ログイン画面に遷移' do
  #     let(:test_user) { user }
  #     it '論理削除したユーザのログイン' do
  #       fill_in 'user[email]', with: test_user.email
  #       fill_in 'user[password]', with: test_user.password
  #       click_button 'ログイン'
    
  #       expect(current_path).to eq(new_user_session_path)
  #     end
  #   end
  # end

  

end
