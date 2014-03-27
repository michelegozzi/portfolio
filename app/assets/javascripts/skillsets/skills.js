function remove_skill_fields(link) {
  $(link).prev("input[type=hidden]").val('1');
  var tr = $(link).parents('tr');
  var tbody = tr.parents('tbody');
  tr.children('input[type=hidden]')
  /*console.log(tr);*/
  tr.hide();
}

// add a new row containing skill's fields
function add_skill_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  var table = $(link).parents('table');
  var tbody = table.find('tbody');
  var ar = tbody.append(content.replace(regexp, new_id));
}