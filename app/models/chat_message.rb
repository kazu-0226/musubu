class ChatMessage < ApplicationRecord
  #アソシエーション
  belongs_to :chat_room
  belongs_to :user, optional: true
  belongs_to :shop, optional: true
  has_many :notifications, dependent: :destroy
  #バリデーション
  with_options presence: true do
    validates :content
    validates :chat_room_id
  end
  

  # Callbacks
  after_create_commit { ChatMessageBroadcastJob.perform_later self }



  # DM通知(user→shop)
  def self.create_notification_dm_by_user!(user_id, chat_room_id)
    @room = ChatRoom.find_by(id: chat_room_id)
    notification = Notification.new(
      visiter_id: user_id,
      visiter_type: 'user',
      visited_id: @room.shop_id,
      visited_type: 'shop',
      chat_room_id: chat_room_id,
      action: 'dm'
    )
    notification.save if notification.valid?
  end

   # DM通知(shop→user)
   def self.create_notification_dm_by_shop!(shop_id, chat_room_id)
    @room = ChatRoom.find_by(id: chat_room_id)
    notification = Notification.new(
      visiter_id: shop_id,
      visiter_type: 'shop',
      visited_id: @room.user_id,
      visited_type: 'user',
      chat_room_id: chat_room_id,
      action: 'dm'
    )
    notification.save if notification.valid?
  end

end
