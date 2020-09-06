class ShopFollowingsController < ApplicationController
    def create
        @follow = current_shop.shop_followings.new(user_id: params[:user_id])
        @follow.save
    end

    def destroy
        @follow = current_shop.shop_followings.find_by(user_id: params[:user_id])
        @follow.destroy
    end
end
