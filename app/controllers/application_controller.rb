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
end
