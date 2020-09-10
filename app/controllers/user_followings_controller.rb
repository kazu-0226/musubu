class UserFollowingsController < ApplicationController
    def create
        @shop = Shop.find_by(id: params[:shop_id])
        @follow = current_user.user_followings.new(shop_id: params[:shop_id])
        @follow.save
        #非同期通信の際にインタンス変数を渡す必要があるため、チャットボタンの表示を定義する
        #ユーザが店舗詳細にてチャットを開始するため、店舗がログインしていないことが条件
        unless shop_signed_in?
        #お店と会員のチャットルームをeachで一つずつ取り出す
        current_user.chat_rooms.each do |cur|
          @shop.chat_rooms.each do |sr|
            #お店と会員のルームIDが等しければすでにルームは作成済みのため、@isRoom = trueとして@roomId = cur.idを代入
            if cur.id == sr.id
              @isRoom = true
              @roomId = cur.id
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
        @shop = Shop.find_by(id: params[:shop_id])
        @follow = current_user.user_followings.find_by(shop_id: params[:shop_id])
        @follow.destroy
    end

end
