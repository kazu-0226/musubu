class NotificationsController < ApplicationController
  def index
    if user_signed_in?
      @notifications = current_user.passive_notifications.where(["visited_id = ? and visited_type = ?", current_user.id, 'user'])
    elsif shop_signed_in?
      @notifications = current_shop.passive_notifications.where(["visited_id = ? and visited_type = ?", current_shop.id, 'shop'])
    end
  end
end
