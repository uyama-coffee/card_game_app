$(document).ready(function(){
  $('.input_contact').hide();
  checkContactMethod();
  $('input[name="resume[contact_method]"]').on('click', function(){
    chengeContactMethod($(this));
  });
    displayChoices();
    $(".add_nested_fields_link").on('click',function(){
      displayChoices();
    });
    selectedCardGame();
  $('.addCareer').on('click',function(){
    is_AddCareer();
  });
  displayNameOfGame();
  inputFileImg();
});
  function inputFileImg(){
    $("input[type='file']").on('change', function(){
      if(this.files && this.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#resumeid').attr('src', e.target.result);
        }
        reader.readAsDataURL(this.files[0]);
      }
    });
  }
  function checkContactMethod(){
    if($('input[checked="checked"]').val() == "phone"){
      $('.input_contact').show();
    } else {
      $('.input_contact').hide();
    }
  }
  function displayNameOfGame() {
    var cardInputField = $("input.card-name");
    console.log(cardInputField);
    cardInputField.each(function(index, elem){
      if(typeof $(this).attr("value") !== typeof undefined && $(this).attr("value") !== false){
        var thisValue = $(this).val();
        var thisText = $(this).siblings('ul').find("li[value='" + thisValue + "']").text();
        $(this).siblings('span').text(thisText + '　▼');
      }
    });
  }
  //連絡方法の切り替え
  function chengeContactMethod(elem){
    var selected = elem.val();
    $('.input_contact').hide();
    console.log('#' + selected);
    $('#' + selected).show();
  }
  //経歴追加&削除ボタンの制御
  function is_AddCareer(){
    $(".nested_fields nested_resume_card_game_experiences").ready(function(){
      displayChoices();
      selectedCardGame();
    });

  }
  function is_RemoveCareer(){

  }

function selectedCardGame(){
  $(".dropdown-content.select-dropdown li").on('click', function(){
    $(this).parent().siblings('span').text($(this).text() + "　▼");
    $(this).parent().siblings('input.card-name').val($(this).val());
    $(this).parent().siblings('input.card-name').attr("value",$(this).val());
    $(this).parent().removeClass("display-block");
  });
}

function displayChoices(){
  var displayed = false;
  $(".card-name").on('click',function(){
    $($(this).siblings('ul')).addClass("display-block");
    displayed = true;
  });

  $(document).mouseup(function(e) {
      var container = $(".dropdown-content.select-dropdown");

      if (!container.is(e.target) && container.has(e.target).length === 0) 
      {
        if(displayed){
            $(".dropdown-content.select-dropdown").removeClass("display-block");
        } else {

        }
      }
  });
}