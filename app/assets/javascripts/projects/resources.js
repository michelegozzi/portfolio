function remove_resource_fields(link) {
  $(link).prev("input[type=hidden]").val('1');
  var tr = $(link).parents('tr');
  var tbody = tr.parents('tbody');
  tr.children('input[type=hidden]')
  /*console.log(tr);*/
  tr.hide();
}

// add a new row containing resource's fields
function add_resource_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  var table = $(link).parents('table');
  var tbody = table.find('tbody');
  var ar = tbody.append(content.replace(regexp, new_id));

  //var resourceFilePathFieldId = ar.find('.resource-file-path-field').last().attr('id');
  /*console.log('resource-file-path-field -> id:' + resourceFilePathFieldId);*/

  //$('#resource_reference_field').val(resourceFilePathFieldId);

  ar.find('.btn-resource-file-upload')
    .last()
    .click(function() {
      $(this).toggleUploadDialog();
    });

  ar.find('.btn-resource-dropbox')
    .last()
    .click(function() {
      $(this).toggleDropboxDialog();
    });

  /*.click(function() {
    $('#resource_upload_dialog').modal('toggle');
  });
  */
}