class Admins::ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all.page(params[:page]).per(10)
  end
end
