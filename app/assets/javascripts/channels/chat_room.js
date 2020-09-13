App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
      $('#chat_messages').append(data["message"]);
      // 自分の発言かどうかif分岐
      // if (){ }
      // class="chat"のchildrenの最後(13行目で追加した発言)
      // lastChild = $('.chat').children().last();
      // left → rightに変換する
      // lastChild.removeClass('chat-box-left').addClass('chat-box-right')
      // lastChild.children().first().removeClass('face-icon-left').addClass('face-icon-right');
      // lastChild.children().last().removeClass('says').addClass('mycomment');
      return ;
  },

  speak: function(chat_room_id, user_id, shop_id, content, current_id) {
    return this.perform('speak', { chat_room_id: chat_room_id, user_id: user_id, shop_id: shop_id, content: content, current_id: current_id });
  
    }
  }, $(document).on('keypress', '[data-behavior~=chat_speaker]', function(event) {
    if (event.keyCode === 13) {
      var userForm = $('#user-id-form');
      var shopForm = $('#shop-id-form');
      var chatRoomForm = $('#chat-room-id-form');
      var contentForm = $('#content-form');
      var currentId = $('#chat-current_id');
      console.log(currentId)
      App.chat_room.speak(chatRoomForm.val(),userForm.val(),shopForm.val(),contentForm.val(), currentId.val());
      //App.chat_room.speak(chatRoomForm.val(),userForm.val(),shopForm.val(),contentForm.val(), currentUserId.val());
      return contentForm.val('');
    }
  }));