// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.jpostal
//= require bootstrap-sprockets
//= require toastr
//= require_tree .

// App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
//     connected: function() {
//       // Called when the subscription is ready for use on the server
//     },
  
//     disconnected: function() {
//       // Called when the subscription has been terminated by the server
//     },
  
//     received: function(data) {
//         alert("dfdf")
//       // Called when there's incoming data on the websocket for this channel
//     },
  
//     speak: function(message) {
//         alert(message);
//         return this.perform('speak');
//       }
//     }, $(document).on('keypress', '[data-behavior~=chat_post]', function(event) {
//       if (event.keyCode === 13) {
//         debugger
//         var userForm = $('#user-id-form');
//         var shopForm = $('#shop-id-form');
//         alert(shopForm.val())
//         var chatRoomForm = $('#chat-room-form');
//         alert(chatRoomForm.val())
//         var chatForm = $('#chat-form');
//         App.chat_room.speak(chatForm.val());
//         return chatForm.val('');
//       }
//     }));