$(document).ready(function(){
	$(".custom-checkbox label").on('click', function(){
		checked($(this));
	});

	$("input[type='file']").on('change', function(){
      if(this.files && this.files[0]){
      	console.log("asd");
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#projectID').attr('src', e.target.result);
        }
        reader.readAsDataURL(this.files[0]);
      }
    });
});

function checked(elem){
	var checkBox = elem.siblings(".custom-control-input");
	checkBox.attr("checked", !checkBox.attr("checked"));
	console.log(checkBox);
}




// $(document).ready(function(){
// 	$(".projectForm_selectGames").find("input").on('click', function(){
// 		test($(this));
// 	});
// });

// function test(elem){
// 	console.log(elem);
// }