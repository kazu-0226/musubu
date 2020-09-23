class HomesController < ApplicationController
  def top
    @update_shops = Shop.where(is_deleted: false).order('shops.updated_at DESC').limit(3)
  end

  def new_guest_user
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def new_guest_shop
    shop = Shop.find_or_create_by!(email: 'guest@example.com') do |shop|
      shop.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in shop
    redirect_to root_path, notice: 'ゲストショップとしてログインしました。'
  end
end
