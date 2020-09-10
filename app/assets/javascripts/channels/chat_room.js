App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
      alert("dfdf")
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(message) {
      alert(message);
      return this.perform('speak');
    }
  }, $(document).on('keypress', '[data-behavior~=chat_post]', function(event) {
    if (event.keyCode === 13) {
      debugger
      var userForm = $('#user-id-form');
      var shopForm = $('#shop-id-form');
      alert(shopForm.val())
      var chatRoomForm = $('#chat-room-form');
      alert(chatRoomForm.val())
      var chatForm = $('#chat-form');
      App.chat_room.speak(chatForm.val());
      return chatForm.val('');
    }
  }));