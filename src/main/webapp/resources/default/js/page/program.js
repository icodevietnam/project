$(function() {

	$('.combobox').selectpicker();

	displayTable();

	$("#newItemForm").validate({
		rules : {
			name : {
				required : true
			},
			description : {
				required : true
			},
			grade : {
				required : true,
				min : 0,
				max : 100
			}
		},
		messages : {
			name : {
				required : "Name is not blank"
			},
			description : {
				required : "Description is not blank"
			},
			grade : {
				required : "Grade is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
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
			},
			grade : {
				required : true,
				min : 0,
				max : 100
			}
		},
		messages : {
			name : {
				required : "Name is not blank"
			},
			description : {
				required : "Description is not blank"
			},
			grade : {
				required : "Grade is not blank",
				min : "Min value is 0",
				max : "Max value is 100"
			}
		}
	});
});

function displayTable() {
	var dataDepartments = [];
	$.ajax({
		url : "/project/program/getAll",
		type : "GET",
		dataType : "JSON",
		async : false,
		cache : false,
		success : function(response) {
			var i = 0;
			$.each(response, function(key, value) {
				i++;
				dataDepartments.push([
						i,
						value.code,
						value.name,
						value.description,
						value.faculty.name,
						value.pl == null ? 'none' : value.pl.username,
						value.ee == null ? 'none' : value.ee.username,
						value.typeOfGrade,
						value.typeOfConduct,
						value.academicYear,
						"<button class='btn btn-sm btn-primary' onclick='editItem(\""
								+ value.code + "\")\' >Edit</button>",
						"<button class='btn btn-sm btn-danger' onclick='deleteItem(\""
								+ value.code + "\")\' >Delete</button>" ]);
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
					"sTitle" : "Code"
				}, {
					"sTitle" : "Name"
				}, {
					"sTitle" : "Description"
				}, {
					"sTitle" : "Faculty"
				}, {
					"sTitle" : "Program Leader"
				}, {
					"sTitle" : "External Examiner"
				}, {
					"sTitle" : "Grade"
				}, {
					"sTitle" : "Conduct"
				}, {
					"sTitle" : "Academic Year"
				}, {
					"sTitle" : "Sửa"
				}, {
					"sTitle" : "Xoá"
				} ]
			});
		}
	});
}

function editItem(str) {
	$.ajax({
		url : "/project/program/get",
		type : "GET",
		data : {
			itemId : str
		},
		dataType : "JSON",
		success : function(response) {
			$("#updateItemForm .itemId").val(response.code);
			$("#updateItemForm .programName").val(response.name);
			$("#updateItemForm .programDescription").val(response.description);
			$("#updateItemForm .programGrade").val(response.typeOfGrade);
			$("#updateItemForm .facultyBox").selectpicker('val',
					"" + response.faculty.id);
			$("#updateItemForm .plBox").selectpicker('val', "" + response.pl);
			$("#updateItemForm .eeBox").selectpicker('val', "" + response.ee);
			$("#updateItemForm .conductBox").selectpicker('val',
					"" + response.typeOfConduct);
			$("#updateItemForm .yearBox").selectpicker('val',
					"" + response.academicYear);
			$("#updateItem").modal("show");
		}
	});
}

function deleteItem(id) {
	if (confirm("Are you sure you want to proceed?") == true) {
		$.ajax({
			url : "/project/program/delete",
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
	if ($("#updateItemForm").valid()) {
		var formData = new FormData($("#updateItemForm")[0]);
		$.ajax({
			url : "/project/program/update",
			type : "POST",
			data : formData,
			contentType : false,
			processData : false,
			dataType : "JSON",
			success : function(response) {
			},
			complete : function() {
				displayTable();
				$("#updateItemForm .itemId").val("");
				$("#updateItemForm .programName").val("");
				$("#updateItemForm .programDescription").val("");
				$("#updateItemForm .programGrade").val("");
				$("#updateItem").modal("hide");
			}
		});
	}
}

function insertItem() {
	if ($("#newItemForm").valid()) {
		var formData = new FormData($("#newItemForm")[0]);
		$.ajax({
			url : "/project/program/new",
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
				$("#programName").val(" ");
				$("#programDescription").val(" ");
			}
		});
	}
}
