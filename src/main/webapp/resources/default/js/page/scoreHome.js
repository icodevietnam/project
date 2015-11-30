$(function() {
	$('.combobox').selectpicker();

	$("#newItemForm").validate({
		rules : {
			math : {
				required : true,
				min : 0,
				max : 100
			},
			literity : {
				required : true,
				min : 0,
				max : 100
			},
			chemistry : {
				required : true,
				min : 0,
				max : 100
			},
			physical : {
				required : true,
				min : 0,
				max : 100
			},
			biological : {
				required : true,
				min : 0,
				max : 100
			}
		},
		messages : {
			math : {
				required : "Math is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
			},
			literity : {
				required : "Literity is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
			},
			chemistry : {
				required : "Chemistry is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
			},
			physical : {
				required : "Physical is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
			},
			biological : {
				required : "Biological is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
			}
		},
	});
});

function insertItem() {
	if ($("#newItemForm").valid()) {
		var math = $("#math").val();
		var literity = $("#literity").val();
		var chemistry = $("#chemistry").val();
		var english = $("#english").val();
		var physical = $("#physical").val();
		var biological = $("#biological").val();
		var conduct = $("#conductBox").val();
		$.ajax({
			url : "/project/score/new",
			type : "POST",
			data : {
				math : math,
				literity : literity,
				chemistry : chemistry,
				physical : physical,
				english : english,
				biological : biological,
				conduct : conduct,
			},
			dataType : "JSON",
			success : function(response) {
				if (response == true) {
					alert("Insert successfully");
				} else {
					alert("Insert fail");
				}
			},
			complete : function() {
				$("#newItemForm").hide();
			}
		});
	}
}
