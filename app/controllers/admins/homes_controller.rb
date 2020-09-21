class Admins::HomesController < ApplicationController
  def top
    @users = User.all
    @active_users = User.where(is_deleted: false)
    @shops = Shop.all
    @active_shops = Shop.where(is_deleted: false)
    @chat_rooms = ChatRoom.all
    @categories = Category.all
  end
end
