jQuery(document).ready(function() {
  jQuery('#projectsTable > tbody').rowLinkTo2( { restPath: '/projects/:id/edit' } );
});