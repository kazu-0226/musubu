class ApplicationController < ActionController::Base
  #ログイン後のルーティング
  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admins_homes_top_path
      when User
        user_path(current_user)
      when Shop
        shop_path(current_shop)
    end
  end


  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  def self.render_with_signed_in_shop(shop, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_shop(shop, scope: :shop) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end
end
