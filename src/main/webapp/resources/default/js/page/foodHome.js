$(function() {
	
	$("#ratingForm").validate({
		rules : {
			point:{
				required:true,
				min : 0,
				max : 10
			}
		},
		messages : {
			point:{
				required:"Point is not blank",
				min:"Min is 0",
				max:"Max is 10"
			}
		}
	});
	
});


function rating(){
	if ($("#ratingForm").valid()) {
		var point = $("#numberPoint").val();
		var foodId = $("#foodId").html();
		$.ajax({
			url : "/project/ratingFood/add",
			type : "POST",
			data : {
				point : point,
				foodId: foodId
			},
			dataType : "JSON",
			success : function(response) {
			},
			complete : function() {
				$("#ratingModal").modal("hide");
			}
		});
	}
}
