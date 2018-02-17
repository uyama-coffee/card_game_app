$(document).ready(function(){
  $('.input_contact').hide();
  // chengeContactMethod();
  $('input[name="resume[contact_method]"]').on('click', function(){
    chengeContactMethod($(this));
  });
    displayChoices();
    $(".add_nested_fields_link").on('click',function(){
      displayChoices();
    });
});
  //連絡方法の切り替え
  function chengeContactMethod(elem){
    var selected = elem.val();
    $('.input_contact').hide();
    console.log('#' + selected);
    $('#' + selected).show();
  }
  //経歴追加&削除ボタンの制御
  function is_AddCareer(){

  }
  function is_RemoveCareer(){

  }

function displayChoices(){
  var displayed = false;
  $(".card-name").on('click',function(){
    $("#card-name-choices").addClass("display-block");
    displayed = true;
  });
  // if(displayed)
  $(document).mouseup(function(e) {
      var container = $("#card-name-choices");
      // if the target of the click isn't the container nor a descendant of the container
      if (!container.is(e.target) && container.has(e.target).length === 0) 
      {
        if(displayed){
            $("#card-name-choices").removeClass("display-block");
        } else {

        }
      }
  });
}