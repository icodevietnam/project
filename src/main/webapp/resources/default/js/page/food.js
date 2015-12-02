$(function() {
	$('.combobox').selectpicker();
	displayTable();
	$('.imageDemo').attr('src',
			"/project/resources/default/images/no-image.jpg");
	$("#newItemForm").validate({
		rules : {
			name : {
				required : true
			},
			description : {
				required : true
			}
		},
		messages : {
			name : {
				required : "Name is not blank"
			},
			description : {
				required : "Description is not blank"
			}
		}
	});

	$("#updateItemForm").validate({
		rules : {
			name : {
				required : true
			},
			description : {
				required : true
			}
		},
		messages : {
			name : {
				required : "Name is not blank"
			},
			description : {
				required : "Description is not blank"
			}
		}
	});

	$("#image").change(function() {
		readUrl(this);
	});

	$(".fileUpload").change(function() {
		readUrl(this);
	});
});

/*
 * function showImage(id){ var link =""; $.ajax({ url :
 * "/project/fileAttached/get", type : "GET", data : { itemId : id }, async
 * :false, cache : false, dataType : "JSON", success : function(response) { link = "<img
 * class='thumbnail' src='/resources/default/images/"+ response.name+ "'/>" }
 * }); return link; }
 */

function displayTable() {
	var dataDepartments = [];
	$.ajax({
		url : "/project/food/getAll",
		type : "GET",
		dataType : "JSON",
		async : false,
		cache : false,
		success : function(response) {
			var i = 0;
			$.each(response, function(key, value) {
				i++;
				var parent;
				dataDepartments.push([
						i,
						value.name,
						value.store.name,
						value.image != null ? "<img width='200px' alt='"
								+ value.image.name + "' src='"
								+ value.image.absolutelyPath + "' />"
								: "No Pictures",
						value.foodType.name,
						"<button class='btn btn-sm btn-primary' onclick='editItem("
								+ value.id + ")' >Edit</button>",
						"<button class='btn btn-sm btn-danger' onclick='deleteItem("
								+ value.id + ")'>Delete</button>" ]);
			});
			$('#tblDepartment').dataTable({
				"bDestroy" : true,
				"bSort" : true,
				"bFilter" : true,
				"bLengthChange" : true,
				"bPaginate" : true,
				"sDom" : '<"top">rt<"bottom"flp><"clear">',
				"aaData" : dataDepartments,
				"aaSorting" : [],
				"aoColumns" : [ {
					"sTitle" : "No"
				}, {
					"sTitle" : "Name"
				}, {
					"sTitle" : "Store"
				}, {
					"sTitle" : "Image"
				}, {
					"sTitle" : "Food Type"
				}, {
					"sTitle" : "Sửa"
				}, {
					"sTitle" : "Xoá"
				} ]
			});
		}
	});
}

function editItem(id) {
	$.ajax({
		url : "/project/food/get",
		type : "GET",
		data : {
			itemId : id
		},
		dataType : "JSON",
		success : function(response) {
			$("#updateItemForm .foodId").val(response.id);
			$("#updateItemForm .foodName").val(response.name);
			$("#updateItemForm .storeBox").selectpicker('val',
					"" + response.store.id + "");
			$("#updateItemForm .foodTypeBox").selectpicker('val',
					"" + response.foodType.id + "");
			tinyMCE.activeEditor.setContent(response.description);
			if (response.image) {
				$('.imageDemo').attr('src', response.image.absolutelyPath);
			}
			$("#updateItem").modal("show");
		}
	});
}

function deleteItem(id) {
	if (confirm("Are you sure you want to proceed?") == true) {
		$.ajax({
			url : "/project/food/delete",
			type : "POST",
			data : {
				itemId : id
			},
			dataType : "JSON",
			success : function(response) {
				displayTable();
			}
		});
	}
}

function editedItem() {
	var currentId = $("#updateItemForm .foodId").val();
	var parentId = $("#updateItemForm .foodBox").val();
	if ($("#updateItemForm").valid() && (currentId != parentId)) {
		var formData = new FormData($("#updateItemForm")[0]);
		$.ajax({
			url : "/project/food/update",
			type : "POST",
			data : formData,
			contentType : false,
			processData : false,
			dataType : "JSON",
			success : function(response) {
			},
			complete : function() {
				displayTable();
				$("#updateItemForm .foodName").val("");
				$("#updateItemForm .foodDescription").val("");
				tinyMCE.activeEditor.setContent("");
				$("#updateItemForm .storeBox").selectpicker('val', "0");
				$("#updateItem").modal("hide");
			}
		});
	} else {
		alert("Can't set the food type by itself, please choose the another food type !!!");
	}
}

function insertItem() {
	if ($("#newItemForm").valid()) {
		var formData = new FormData($("#newItemForm")[0]);
		$.ajax({
			url : "/project/food/new",
			type : "POST",
			data : formData,
			contentType : false,
			processData : false,
			dataType : "JSON",
			success : function(response) {
			},
			complete : function() {
				displayTable();
				$("#newItem").modal("hide");
				$("#foodName").val(" ");
				$("#foodDescription").val(" ");
				tinyMCE.activeEditor.setContent("");
				$("#storeBox").selectpicker('val', "0");
				$("#foodTypeBox").selectpicker('val', "0");
				$('.imageDemo').attr('src',
						"/project/resources/default/images/no-image.jpg");
			}
		});
	}
}

function readUrl(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('.imageDemo').attr('src', e.target.result);
		}

		reader.readAsDataURL(input.files[0]);
	}
}
