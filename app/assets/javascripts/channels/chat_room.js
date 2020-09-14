App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
      // 自分の発言かどうかchat_rooms/show.html.erbのshow_idとsend_idでif分岐
      show_id = $('#show_id').data('show_id')
      if (data['send_id'] == show_id){ 
        $('#chat_messages').append(data["message_right"])
    }else{
        $('#chat_messages').append(data["message_left"])
    }
    return ;


  //   $('#chat_messages').append(data["message"]);
  //   debugger
  //   // 自分の発言かどうかif分岐
  //   if (data['current_id']== $('#chat_messages').children().last().user_id || $('#chat_messages').children().last().shop_id ){ 
  //   // class="chat_messages"のchildrenの最後(送信した発言)
  //   lastChild = $('#chat_messages').children().last();
  //   // chat_boxのleft → rightに変換する
  //   lastChild.removeClass('chat-box-left').addClass('chat-box-right')
  //   // chat_boxのさらに子要素のleft → rightに変換する
  //   lastChild.children().first().removeClass('faceicon-left').addClass('faceicon-right');
  //   lastChild.children().last().removeClass('says').addClass('mycomment');
  // }else{
  //   lastChild = $('#chat_messages').children().last();
  //   // chat_boxのleft → rightに変換する
  //   lastChild.removeClass('chat-box-right').addClass('chat-box-left')
  //   // chat_boxのさらに子要素のleft → rightに変換する
  //   lastChild.children().first().removeClass('faceicon-right').addClass('faceicon-left');
  //   lastChild.children().last().removeClass('mycomment').addClass('says');
  // }

    
  //   return ;
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
      //App.chat_room.speak(chatRoomForm.val(),userForm.val(),shopForm.val(),contentForm.val(), currentUserId.val());
      return contentForm.val('');
    }
  }));