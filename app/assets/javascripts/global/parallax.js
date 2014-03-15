$(document).ready(function(){

  // cache the window object
  $window = $(window);

  $('.full-panel').each(function() {
      console.log('full-panel');
      // declare the variable to affect the defined data-type
      var $scroll = $(this);

      $(window).scroll(function() {
          console.log('scroll');
          // HTML5 proves useful for helping with creating JS functions!
          // also, negative value because we're scrolling upwards
          var yPos = -($window.scrollTop() / 6);

          // background position
          var coords = '50% ' + yPos + 'px';

          // move the background
          console.log(coords);
          $scroll.css({ backgroundPosition: coords });
      }); // end window scroll
  });  // end section function
});