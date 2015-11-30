$(function() {
	displayTable();
	
	$("#newItemForm").validate({
		rules : {
			roleName:{
				required:true
			},
			roleDescription:{
				required:true
			}
		},
		messages : {
			roleName:{
				required:"Name is not blank"
			},
			roleDescription:{
				required:"Description is not blank"
			}
		},
	});
	
	$("#updateItemForm").validate({
		rules : {
			roleName:{
				required:true
			},
			roleDescription:{
				required:true
			}
		},
		messages : {
			roleName:{
				required:"Name is not blank"
			},
			roleDescription:{
				required:"Description is not blank"
			}
		},
	});
});

function displayTable() {
	var dataDepartments = [];
	$.ajax({
		url : "/project/role/getAll",
		type : "GET",
		dataType : "JSON",
		success : function(response) {
			var i = 0;
			$.each(response, function(key, value) {
				i++;
				dataDepartments.push([
						i,
						value.name,value.description,
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
					"sTitle" : "Description"
				}, {
					"sTitle" : "Edit"
				}, {
					"sTitle" : "Delete"
				} ]
			});
		}
	});
}

function editItem(id) {
	$.ajax({
		url : "/project/role/get",
		type : "GET",
		data : {
			itemId : id
		},
		dataType : "JSON",
		success : function(response) {
			$("#updateItemForm .roleId").val(response.id);
			$("#updateItemForm .roleName").val(response.name);
			$("#updateItemForm .roleDescription").val(response.description);
			$("#updateItem").modal("show");
		}
	});
}

function deleteItem(id) {
	if (confirm("Are you sure you want to proceed?") == true) {
		$.ajax({
			url : "/project/role/delete",
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
	if($("#updateItemForm").valid()){
		var roleId = $("#updateItemForm .roleId").val();
		var roleName = $("#updateItemForm .roleName").val();
		var roleDescription = $("#updateItemForm .roleDescription").val();
		$.ajax({
			url : "/project/role/update",
			type : "POST",
			data : {
				roleId : roleId,
				roleName : roleName,
				roleDescription : roleDescription
			},
			dataType : "JSON",
			success : function(response) {
			},complete:function(){
				displayTable();
				$("#updateItemForm .roleId").val(" ");
				$("#updateItemForm .roleName").val(" ");
				$("#updateItemForm .roleDescription").val(" ");
				$("#updateItem").modal("hide");
			}
		});
	}
}

function insertItem() {
	if($("#newItemForm").valid()){
		var roleName = $("#roleName").val();
		var roleDescription = $("#roleDescription").val();
		$.ajax({
			url : "/project/role/new",
			type : "POST",
			data : {
				roleName : roleName,
				roleDescription : roleDescription
			},
			dataType : "JSON",
			success : function(response) {
			},
			complete : function(){
				displayTable();
				$("#newItem").modal("hide");
				$("#roleName").val(" ");
				$("#roleDescription").val(" ");
			}
		});
	}
}
