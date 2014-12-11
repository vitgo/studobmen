$(document).ready(function() {
	$("#SearchButton").click(function(e){
		processSubmit(e);
	});
	$("#SearchInput").bind("keyup", function(e){
		var code = e.which;
		if(code == 13) {
			processSubmit(e);
		}
	});

	function processSubmit(e) {
		e.preventDefault();
		var url = $("#SearchButton").attr("href");
		var term = $("#SearchInput").val();
		url += term;
		window.location = url;
	}
	
	$(".showItemBtn").click(function(e){
		e.preventDefault();
		var id = $(this).parents("tr").find(".itemId").html();
		$.ajax({
			type: "GET",
			url: ROOT_PATH + "/items/" + id + ".json",
			statusCode: {
				200: function(item) {
					$("#ItemType").html(item.type);
					$("#ItemDiscipline").html(item.discipline);
					$("#ItemEi").html(item.ei);
					$("#ItemTeacher").html(item.teacher);
					if(item.isElectronic) {
						$("#ItemIsElectronic img.no-icon").addClass('hide');
						$("#ItemIsElectronic img.yes-icon").removeClass('hide');
					} else {
						$("#ItemIsElectronic img.no-icon").removeClass('hide');
						$("#ItemIsElectronic img.yes-icon").addClass('hide');
					}
					$("#ItemPrice").html(item.price);
					$("#ItemId").val(item.id);
				 }
			},
			dataType: "json",
			async: false
		});
		
		$("#ItemDisciplineInput input").attr("placeholder", "someText");
	});
	
	$("#ItemSubmitBtn").click(function(e){
		var valid = true;
		$.each($(".control-group input"), function() {
			if($(this).val().trim() == "") {
				$(this).parents(".control-group").addClass("error");
				valid = false;
			} else {
				$(this).parents(".control-group").removeClass("error");
			}
		});
		var email = $("#ItemEmailInput input").val();
		if(!validateEmail(email)) {
			$("#ItemEmailInput").addClass("error");
			valid = false;
		} else {
			$("#ItemEmailInput").removeClass("error");
		}
		if(!valid) {
			e.preventDefault();
		}
	});
	
	$("#submitUserEmailBtn").click(function(e){
		var valid = true;
		var email = $("#userEmailInput").val();
		if(email.trim() == "" || !validateEmail($("#userEmailInput").val())) {
			$("#userEmailInput").parents(".control-group").addClass("error");
			valid = false;
		} else {
			$("#userEmailInput").parents(".control-group").removeClass("error");
		}
		if(!valid) {
			e.preventDefault();
		}
	});
});

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 