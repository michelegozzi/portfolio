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
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require google_analytics
//= require ../global/parallax

$(document).ready(function(){

  $siteNavbar = $('#site-navbar');
  $siteNavbar.addClass('navbar-fixed-top');
  $siteNavbar.addClass('navbar-default');
  $siteNavbar.removeClass('navbar-inverse');
  
  $body = $('body');
  $body.attr('data-spy', 'scroll');
  $body.attr('data-target', '#site-navbar');
  $body.scrollspy({ target: '#site-navbar' })

  $(".navbar-collapse ul li a[href^='#']").on('click', function(e) {
    target = this.hash;
    // prevent default anchor click behavior
    e.preventDefault();

    // animate
    $('html, body').animate({
      scrollTop: $(this.hash).offset().top
      },
      300,
      function(){

        // when done, add hash to url
        // (default click behaviour)
        window.location.hash = target;
      });
  });

});
