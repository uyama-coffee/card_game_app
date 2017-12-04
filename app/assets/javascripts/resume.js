//連絡方法の切り替え
function chengeContactMethod(){
  var selected = $('input[name="resume[contact_method]"]:checked').val();
  $('.input_contact').hide();
  $('#type' + selected).show();
}
//経歴追加&削除ボタンの制御
function is_AddCareer(){

}
function is_RemoveCareer(){

}
