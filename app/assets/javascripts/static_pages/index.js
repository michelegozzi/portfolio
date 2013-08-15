jQuery(document).ready(function () {

  $('#pTab a:first').tab('show');

  $('#pTab a').click(function (e) {
    console.log('asdf');
    e.preventDefault();
    $(this).tab('show');
  });


  jQuery('.tab-content')
    .children()
    .each(function (){
      //console.log();
      var id = $(this).first().attr('id');
      jQuery('a[rel='+id+']').colorbox({
        transition: 'fade',
        speed: 500,
        current: "{current} of {total}",
        scalePhotos: true,
        width: "80%",
        height: "80%"
      });
    });

  
});