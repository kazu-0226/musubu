$(document).on('turbolinks:load', function() { 
App.chat_room = App.cable.subscriptions.create({
  channel: "ChatRoomChannel", room: $('#room').data('room_id')
}, {
  connected: function () {
      // Called when the subscription is ready for use on the server
  },
  disconnected: function () {
      // Called when the subscription has been terminated by the server
  },
  received: function (data) {
      // Called when there's incoming data on the websocket for this channel
      // 自分の発言かどうかchat_rooms/show.html.erbのshow_idとsend_idでif分岐
      show_id = $('#show_id').data('show_id')
      if (data['send_id'] == show_id) {
          $('#chat_messages').append(data["message_right"])
      } else {
          $('#chat_messages').append(data["message_left"])
      }
      return;
  },
  speak: function (chat_room_id, user_id, shop_id, content) {
      return this.perform('speak', {
          chat_room_id: chat_room_id,
          user_id: user_id,
          shop_id: shop_id,
          content: content
      });
  },
},
$('#chat_sendbtn').on('click', function (event) {
        console.log("click")
          var userForm = $('#user-id-form');
          var shopForm = $('#shop-id-form');
          var chatRoomForm = $('#chat-room-id-form');
          var contentForm = $('#content-form');
          App.chat_room.speak(chatRoomForm.val(), userForm.val(), shopForm.val(), contentForm.val());
          //App.chat_room.speak(chatRoomForm.val(),userForm.val(),shopForm.val(),contentForm.val(), currentUserId.val());
          return contentForm.val('');
  }
)
);
});

$(document).on('turbolinks:visit', function() { 
    App.chat_room.unsubscribe();
});