$(document).ready(function(){
	$(".custom-checkbox label").on('click', function(){
		checked($(this));
	});
});

function checked(elem){
	// console.log(elem.siblings(0));
	// console.log(elem);
	var checkBox = elem.siblings(".custom-control-input");
	checkBox.attr("checked", !checkBox.attr("checked"));
	// console.log(checked.val());
	console.log(checkBox);
	// checkBox.attr("checked", !checkBox.attr("checked"));
}




$(document).ready(function(){
	$(".projectForm_selectGames").find("input").on('click', function(){
		test($(this));
	});
});

function test(elem){
	console.log(elem);
}