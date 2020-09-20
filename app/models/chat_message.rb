class ChatMessage < ApplicationRecord
  #アソシエーション
  belongs_to :chat_room
  belongs_to :user, optional: true
  belongs_to :shop, optional: true

  #バリデーション
  with_options presence: true,on: :update do
    validates :content
    validates :chat_room_id
  end
  

  # Callbacks
  after_create_commit { ChatMessageBroadcastJob.perform_later self }

end
