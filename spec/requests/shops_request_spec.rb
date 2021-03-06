require 'rails_helper'

RSpec.describe "Shops", type: :request do

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

  describe 'ユーザーログイン' do
    subject do
      fill_in 'shop[email]', with: shop.email
      fill_in 'shop[password]', with: shop.password
      click_button 'ログイン'
    end
    # let(:shop) { create(:shop) }
    before { visit new_shop_session_path }

    # context 'ログイン画面に遷移' do
    context '論理削除されていない shop の場合' do
      let(:shop) { create(:shop) }
      it 'ログインに成功する' do
        subject
        expect(page).to have_content '編集'
      end

      it 'ログインに失敗する' do
        fill_in 'shop[email]', with: ''
        fill_in 'shop[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_shop_session_path)
      end
    end

    context '論理削除された shop の場合' do
      let(:shop) { create(:shop,is_deleted:true) }
      it 'ログインできない' do
        subject
        expect(current_path).to eq(new_shop_session_path)
      end
    end

  end

  describe '編集のテスト' do
    let(:test_shop) { create(:shop) }
    let(:test_shop2) { create(:shop) }
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        sign_in test_shop
        visit edit_shop_path(test_shop)
        expect(current_path).to eq('/shops/' + test_shop.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        sign_in test_shop
        visit edit_shop_path(test_shop2)
        expect(current_path).to eq('/')
      end
    end
  end

end
