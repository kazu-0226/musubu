App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
  
    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
    },
  
    speak: function(message) {
        window.alert(message);
        return this.perform('speak');
      }
    }, $(document).on('keypress', '[data-behavior~=chat_post]', function(event) {
        alert("aaaaa")
      if (event.keyCode === 13) {
        var chatForm = $('#chat-form');
        App.chat.speak(chatForm.val());
        return chatForm.val('');
      }
    }));
