jQuery(document).ready(function() {
  jQuery('#skillsets_table > tbody').rowLinkTo2( { restPath: '/skillsets/:id/edit' } );
});