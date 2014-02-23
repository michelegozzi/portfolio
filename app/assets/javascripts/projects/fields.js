$(document).ready(function() {
  $('.btn-resource-file-upload')
    .click(function() {
      $(this).toggleUploadDialog();
    });

  $('.btn-resource-dropbox')
    .click(function() {
      $(this).toggleDropboxDialog();
    });

  //var button = Dropbox.createChooseButton(options);
  //$('.file-path').appendChild(button);
});

$.fn.toggleDropboxDialog=function()
{
  //var input = this.siblings('input.resource-filepath-field');
  var input = this.parents('tr').find('input[class*=resource-filepath-field]');

  if (input === undefined) {
    console.error('esource-filepath-field input element not found!');
  }

  options = {

  // Required. Called when a user selects an item in the Chooser.
    success: function(files) {
        //console.log("Here's the file link: " + files[0].link);

        if (input !== undefined)
          input.val(files[0].link);
        else
          console.error('resource-filepath-field input element is null!');
    },

    // Optional. Called when the user closes the dialog without selecting a file
    // and does not include any parameters.
    cancel: function() {

    },

    // Optional. "preview" (default) is a preview link to the document for sharing,
    // "direct" is an expiring link to download the contents of the file. For more
    // information about link types, see Link types below.
    linkType: "preview", // or "direct"

    // Optional. A value of false (default) limits selection to a single file, while
    // true enables multiple file selection.
    multiselect: false, // or true

    // Optional. This is a list of file extensions. If specified, the user will
    // only be able to select files with these extensions. You may also specify
    // file types, such as "video" or "images" in the list. For more information,
    // see File types below. By default, all extensions are allowed.
    //extensions: ['.jpg', '.gif', '.png'],
  };

  Dropbox.choose(options);
};