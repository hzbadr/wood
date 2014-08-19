// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-1.11.0
//= require jquery_ujs
//= require bootstrap.min
//= require plugins/metisMenu/metisMenu.min
//= require sb-admin-2.js
//= require line_items
//= require transactions

var last_clicked_link ;


function ready(){
  $('.nav.nav-second-level').collapse();
  $('.nav.nav-second-level').collapse('hide');
}

$(document).ready(function(){
  $('#side-menu a').on('click', function(){
    last_clicked_link = $(this);
  });
});

$(document).on('page:load', ready)