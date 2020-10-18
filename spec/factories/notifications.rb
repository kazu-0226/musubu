FactoryBot.define do
  factory :notification do
    visiter_id { 1 }
    visiter_type { "MyString" }
    visited_id { 1 }
    visited_id { "MyString" }
    chat_room_id { 1 }
    chat_message_id { 1 }
    action { "MyString" }
    checked { false }
  end
end
