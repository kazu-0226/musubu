class UserFollowingsController < ApplicationController
    def create
        @follow = current_user.user_followings.new(shop_id: params[:shop_id])
        @follow.save
    end

    def destroy
        @follow = current_user.user_followings.find_by(shop_id: params[:shop_id])
        @follow.destroy
    end

end
