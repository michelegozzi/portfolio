var uploadProgressBar;
var uploadProgressCounter;

function startUpload(){
  $('#resource_upload_progress_bar').show();
  $('#resource_data').hide();
  $('#resource_upload_button').hide();

  var uploadProgressCounter = 0;
  var uploadProgressBar = setInterval(function(){updateProgressBar()},200);
  $('#resource_upload_progress_bar > div.bar').css('width', '0%');

  return true;
}

function updateProgressBar()
{
  if (uploadProgressCounter <= 90) uploadProgressCounter += 10;
  $('#resource_upload_progress_bar > div.bar').css('width', uploadProgressCounter+'%');
}

function stopUpload(result, resource_reference_field, resource_filename) { /*, resource_relativepath*/
  if (uploadProgressBar) clearInterval(uploadProgressBar);
  $('#resource_upload_progress_bar > div.bar').css('width', '100%');
  $('#'+resource_reference_field).val(resource_filename);
  /*$('#'+resource_reference_field).val(resource_relativepath);
  $('#'+resource_reference_field).siblings('.resource-filename-field').val(resource_filename);*/

  if (result == 1) {
    $('#resource_upload_dialog_result').html('<span class="msg">The file was uploaded successfully!<\/span><br/><br/>');
  }
  else {
     $('#resource_upload_dialog_result').html('<div class=\"alert alert-block\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><h4>Warning!</h4>There was an error during file upload!</div>');
  }
  //$('#resource_upload_progress_bar').hide();
  return true;   
}

$(document).ready(function() {
  $('#resource_upload_progress_bar').hide();

  $('#resource_upload_dialog').on('shown', function () {
    $('#resource_upload_progress_bar').hide();
    $('#resource_data').show();
    $('#resource_data').val('');
    $('#resource_upload_button').show();
  });


});

$.fn.toggleUploadDialog=function()
{
  console.log(this);
  //var resourceFilePathFieldId = ar.find('.resource-file-path-field').last().attr('id');
  var resourceFilePathFieldId = this.siblings('input.resource-filepath-field').attr('id');
  console.log('resource-filepath-field -> id:' + resourceFilePathFieldId);

  $('#resource_reference_field').val(resourceFilePathFieldId);
  $('#resource_upload_dialog').modal('toggle');
};



//
  /*console.log('resource-file-path-field -> id:' + resourceFilePathFieldId);*/

  //$('#resource_reference_field').val(resourceFilePathFieldId);

  //ar.find('.btn-resource-file-upload').last().click(function() {
    /*console.log('calling modal');*/
    //$('#resource_upload_dialog').modal('toggle');
  //});