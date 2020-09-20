class ChatMessage < ApplicationRecord
  #アソシエーション
  belongs_to :chat_room
  belongs_to :user, optional: true
  belongs_to :shop, optional: true

  #バリデーション
  validates :content, presence: true

  # Callbacks
  after_create_commit { ChatMessageBroadcastJob.perform_later self }

end
