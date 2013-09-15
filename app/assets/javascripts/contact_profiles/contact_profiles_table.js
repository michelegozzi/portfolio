jQuery(document).ready(function() {
  jQuery('#contact_profiles_table > tbody').rowLinkTo2( { restPath: '/contact_profiles/:id/edit' } );
});