function select_status(i){
  var contact_id = "#contact_id_" + i
  var status_id = "#status_id_" + i
  $.ajax({
    url: "contacts/update",
    type: "PUT",
    data: {contact: {contact_id: $(contact_id).val(), status: $(status_id).val()}}
  })
}
