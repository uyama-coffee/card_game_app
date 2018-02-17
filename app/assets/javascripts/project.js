$(document).ready(function(){
	$(".custom-checkbox label").on('click', function(){
		checked($(this));
	});
});

function checked(elem){
	// console.log(elem.siblings(0));
	var checkBox = elem.siblings(0);
	console.log(checkBox);
	checkBox.attr("checked", !checkBox.attr("checked"));
}