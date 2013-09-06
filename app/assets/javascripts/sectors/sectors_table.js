jQuery(document).ready(function() {
  jQuery('#sectorsTable > tbody').rowLinkTo2( { restPath: '/sectors/:id/edit' } );
});