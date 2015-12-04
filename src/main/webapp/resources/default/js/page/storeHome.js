$(function() {
	$('.combobox').selectpicker();
	displayComment();
	
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
	
	$("#addCommentForm").validate({
		rules : {
			title:{
				required:true
			},
			content:{
				required:true
			},
			point:{
				required:true,
				min : 0,
				max : 10
			}
		},
		messages : {
			title:{
				required:"Title is not blank"
			},
			content:{
				required:"Content is not blank"
			},
			point:{
				required:"Point is not blank",
				min:"Min is 0",
				max:"Max is 10"
			}
		}
	});
});

function comment() {
	tinymce.triggerSave();
	if ($("#addCommentForm").valid()) {
		var title = $("#titleStore").val();
		var content = tinyMCE.get('content').getContent();;
		var point = $("#point").val();
		var storeId = $("#storeId").html();
		$.ajax({
			url : "/project/comment/add",
			type : "POST",
			data : {
				title :  title,
				content : content,
				point : point,
				storeId: storeId
			},
			dataType : "JSON",
			success : function(response) {
				$("#titleStore").val("");
				$("#point").val("");
				tinyMCE.activeEditor.setContent("");
			},
			complete : function() {
				displayComment();
			}
		});
	}
}

function displayComment(){
	var storeId = $("#storeId").html();
	$(".comment-content").empty();
	$.ajax({
		url : "/project/comment/listCommentByStore",
		type : "POST",
		data : {
			storeId: storeId
		},
		dataType : "JSON",
		success : function(response) {
			$.each(response,function(key,value){
				$(".comment-content").append("" +
				"<span style='background:black;padding-left:20px;color:white;height:30px;display:block;' class='title'>Title:  "+value.title+"</span>"
				+"<span style='display:block;padding-left:20px;' class='name'>Point: "+value.point+" - User:  "+value.user.username+" says:</span>"
				+"<span style='display:block;padding-left:20px;border-bottom:1px #000 dotted;' class='content'>"+value.content+"</span>" 
				+"");
			});
		},
		complete : function() {
		}
	});
}

function rating(){
	if ($("#ratingForm").valid()) {
		var point = $("#numberPoint").val();
		var storeId = $("#storeId").html();
		$.ajax({
			url : "/project/rating/add",
			type : "POST",
			data : {
				point : point,
				storeId: storeId
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
