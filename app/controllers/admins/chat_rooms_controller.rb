class Admins::ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.csv do
        @chat_rooms = ChatRoom.all
      end
    end
  end
end
