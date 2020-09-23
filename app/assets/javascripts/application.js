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


$(document).on('turbolinks:load', function() { 
$(function(){
    var imgHeight = $('.js-mainVisual').outerHeight(); //画像の高さを取得。これがイベント発火位置になる。
    var header = $('.js-header'); //ヘッダーコンテンツ
    
    $(window).on('turbolinks:load scroll', function(){
       if ($(window).scrollTop() < imgHeight) {
         //メインビジュアル内にいるので、クラスを外す。
         header.removeClass('headerColor-default');
         $(".nav-link").removeClass('nav-link-default');
         $('.logo').attr('logo6.png');
       }else {
         //メインビジュアルより下までスクロールしたので、クラスを付けて色を変える
         header.addClass('headerColor-default');
         $(".nav-link").addClass('nav-link-default');
         $('.logo').attr('logo5.png');
       }
    });
  });
});

// function addToSearchUrl() {
//     let path = location.pathname;
//     let pattern = /users\/search.*$/
  
//     // URLが正しければ変更は不要
//     if(path.match(pattern)){history.replaceState('', '', `${ path }`)} return;
//   };