class ShopFollowingsController < ApplicationController
    def create
        @user = User.find_by(id: params[:user_id])
        @follow = current_shop.shop_followings.new(user_id: params[:user_id])
        @follow.save
        #非同期通信の際にインタンス変数を渡す必要があるため、チャットボタンの表示を定義する
        #店がユーザ詳細にてチャットを開始するため、ユーザがログインしていないことが条件
        unless user_signed_in?
        #お店と会員のチャットルームをeachで一つずつ取り出す
        current_shop.chat_rooms.each do |csr|
          @user.chat_rooms.each do |ur|
            #お店と会員のルームIDが等しければすでにルームは作成済みのため、@isRoom = trueとして@roomId = csr.idを代入
            if csr.id == ur.id
              @isRoom = true
              @roomId = csr.id
            end
          end
        end
        #@isRoomがfalse、つまりルームがなければインスタンス作成
        unless @isRoom
          @room = ChatRoom.new
        end
      end
    end

    def destroy
        @user = User.find_by(id: params[:user_id])
        @follow = current_shop.shop_followings.find_by(user_id: params[:user_id])
        @follow.destroy
    end
end
