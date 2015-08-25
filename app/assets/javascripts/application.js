// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap.notify
//= require video
//= require_tree .

$(document).ready(function(){

  $('.heart-vote').click(function() {
    $.ajax({
      url: "/videos/like",
      type: "PATCH",
      data: {
        'video_id': $(this).attr('data-video-id'),
        'voter_model': $(this).attr('data-voter-model'),
        'voter_id': $(this).attr('data-voter-id')
      },
    });
  });

});
