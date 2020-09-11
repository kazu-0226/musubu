App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
      return $('#chat_messages').append('<li>' + data["content"] + '</li>');
  },

  speak: function(chat_room_id, user_id, shop_id, content) {
     return this.perform('speak', { chat_room_id: chat_room_id, user_id: user_id, shop_id: shop_id, content: content });
  
    }
  }, $(document).on('keypress', '[data-behavior~=chat_speaker]', function(event) {
    if (event.keyCode === 13) {
      var userForm = $('#user-id-form');
      var shopForm = $('#shop-id-form');
      var chatRoomForm = $('#chat-room-id-form');
      var contentForm = $('#content-form');
      App.chat_room.speak(chatRoomForm.val(),userForm.val(),shopForm.val(),contentForm.val());
      return contentForm.val('');
    }
  }));