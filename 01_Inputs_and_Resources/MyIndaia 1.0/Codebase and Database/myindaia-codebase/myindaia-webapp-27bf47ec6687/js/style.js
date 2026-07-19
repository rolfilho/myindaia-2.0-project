

$(".input-label").focusin(function(){

	$("label[for=" +this.id+ "]").addClass("active");
	$("label[for=" +this.id+ "]").css("color", "rgba(30, 136, 229, 1)");
	
	$(this).css("border-bottom", "1px solid rgba(30, 136, 229, 1)");			
//	$(this).css("box-shadow", "0 1px 0 0 rgba(30, 136, 229, 1)");			

});

$(".input-label").focusout(function(){

	if (this.value == "") {
		$("label[for=" +this.id+ "]").removeClass("active");
		$(this).css("border-bottom-color", "#9e9e9e");		
	} else {
		$(this).css("border-bottom-color", "#4caf50");
	};
	$("label[for=" +this.id+ "]").css("color", "#9e9e9e");	

});

