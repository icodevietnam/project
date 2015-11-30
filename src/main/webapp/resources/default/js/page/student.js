$(function() {
	$('.combobox').selectpicker();
	$(".dateInput").datepicker();
	//
	displayTable();
	$("#newItemForm").validate({
		rules : {
			userName : {
				required : true,
				remote : {
					url : '/project/user/checkUsername',
					type : 'post',
					data :{
						username : function(){
							return $("#userName").val();
						}
					}
				}
			},
			password : {
				required : true,
				minlength : 5
			},
			confirmPassword : {
				required : true,
				equalTo : "#password"
			},
			fullname : {
				required : true
			},
			birthDate : {
				required : true
			},
			email : {
				required : true,
				remote : {
					url : '/project/user/checkEmail',
					type : 'post',
					data :{
						email : function(){
							return $("#email").val();
						}
					}
				}
			},
			address : {
				required : true
			},
			phone : {
				required : true
			}
		},
		messages : {
			userName : {
				required : "Username is not blank.",
				remote : "The Username is existed."
			},
			password : {
				required : "Password is not blank",
				minlength : "Password is not less than 5 characters."
			},
			confirmPassword : {
				required : "Confirm password is not blank",
				equalTo : "Password and confirm password are not the same"
			},
			fullname : {
				required : "Full name is not blank"
			},
			birthDate : {
				required : "The birthdate is not blank"
			},
			email : {
				required : "The email is not blank",
				remote : "The email is existed."
			},
			address : {
				required : "Address is not blank"
			},
			phone : {
				required : "Phone is not blank"
			}
		},
	});

	$("#changeModalForm").validate({
		rules : {
			password : {
				required : true,
				minlength : 5
			},
			confirmPassword : {
				required : true,
				equalTo : "#changeModalForm .password"
			}
		},
		messages : {
			password : {
				required : "Password is not blank",
				minlength : "Password is not less than 5 characters."
			},
			confirmPassword : {
				required : "Confirm password is not blank",
				equalTo : "Password and confirm password are not the same"
			}
		},
	});

	$("#updateItemForm").validate({
		rules : {
			userName : {
				required : true
			},
			fullname : {
				required : true
			},
			birthDate : {
				required : true
			},
			address : {
				required : true
			},
			phone : {
				required : true
			}
		},
		messages : {
			userName : {
				required : "Username is not blank."
			},
			fullname : {
				required : "Full name is not blank"
			},
			birthDate : {
				required : "The birthdate is not blank"
			},
			address : {
				required : "Address is not blank"
			},
			phone : {
				required : "Phone is not blank"
			}
		},
	});
});

function insertItem() {

	if ($("#newItemForm").valid()) {
		var userName = $("#userName").val();
		var password = $("#password").val();
		var fullname = $("#fullname").val();
		var birthDate = $("#birthDate").val();
		var email = $("#email").val();
		var address = $("#address").val();
		var gender = $("#genderBox").val();
		var state = $("#stateBox").val();
		var phone = $("#phone").val();
		$.ajax({
			url : "/project/student/new",
			type : "POST",
			data : {
				userName : userName,
				password : password,
				fullname : fullname,
				birthDate : birthDate,
				email : email,
				address : address,
				gender : gender,
				state : state,
				phone : phone
			},
			dataType : "JSON",
			success : function(response) {
				if (response === "false") {
					alert("Can't delete because this is the root admin");
				}
			},
			complete : function() {
				displayTable();
				$("#newItem").modal("hide");
				$("#userName").val("");
				$("#password").val("");
				$("#confirmPassword").val("");
				$("#fullname").val("");
				$("#birthDate").val("");
				$("#email").val("");
				$("#address").val("");
				$("#phone").val("");
			}
		});
	}
}

function displayTable() {
	var dataUsers = [];
	$.ajax({
		url : "/project/student/getAll",
		type : "GET",
		dataType : "JSON",
		success : function(response) {
			var i = 0;
			$.each(response, function(key, value) {
				i++;
				var state = "";
				if (value.state == "active") {
					state = "Active";
				} else if (value.state == "absent") {
					state = "Absent";
				} else {
					state = "Resign";
				}
				dataUsers.push([
						i,
						value.username,
						value.fullName,
						value.birthDate,
						value.email,
						value.address,
						state,
						value.role.description,
						"<button class='btn btn-sm btn-primary' onclick='resetPassword("
								+ value.id + ")' >Reset Password</button>",
						"<button class='btn btn-sm btn-primary' onclick='changePass("
								+ value.id + ")' >Change Password</button>",
						"<button class='btn btn-sm btn-primary' onclick='editItem("
								+ value.id + ")' >Change Information</button>",
						"<button class='btn btn-sm btn-danger' onclick='deleteItem("
								+ value.id + ")'>Delete</button>" ]);
			});
			$('#tblUser').dataTable({
				"bDestroy" : true,
				"bSort" : true,
				"bFilter" : true,
				"bLengthChange" : true,
				"bPaginate" : true,
				"sDom" : '<"top">rt<"bottom"flp><"clear">',
				"aaData" : dataUsers,
				"aaSorting" : [],
				"aoColumns" : [ {
					"sTitle" : "No"
				}, {
					"sTitle" : "Username"
				}, {
					"sTitle" : "Full name"
				}, {
					"sTitle" : "Birth date"
				}, {
					"sTitle" : "Email"
				}, {
					"sTitle" : "Address"
				}, {
					"sTitle" : "State"
				}, {
					"sTitle" : "Role"
				}, {
					"sTitle" : "Reset Password"
				}, {
					"sTitle" : "Change password"
				}, {
					"sTitle" : "Change"
				}, {
					"sTitle" : "Delete"
				} ]
			});
		}
	});
}

function resetPassword(id) {
	$.ajax({
		url : "/project/student/resetPassword",
		type : "GET",
		data : {
			itemId : id
		},
		dataType : "JSON",
		success : function(response) {
			if (response == true) {
				alert("Reset Password is successful.")
			} else {
				alert("Reset Password is fail");
			}
		}
	});
}

function editItem(id) {
	$.ajax({
		url : "/project/student/get",
		type : "GET",
		data : {
			itemId : id
		},
		dataType : "JSON",
		success : function(response) {
			$("#updateItemForm .userId").val(response.id);
			$("#updateItemForm .userName").val(response.username);
			$("#updateItemForm .fullname").val(response.fullName);
			$("#updateItemForm .birthDate").val(response.birthDate);
			$("#updateItemForm .email").val(response.email);
			$("#updateItemForm .address").val(response.address);
			$("#updateItemForm .phone").val(response.phone);
			$("#updateItemForm .genderBox").selectpicker('val',
					"" + response.gender);
			$("#updateItemForm .stateBox").selectpicker('val',
					"" + response.state);
			$("#updateItem").modal("show");
		}
	});
}

function deleteItem(id) {
	if (confirm("Are you sure you want to proceed?") == true) {
		$.ajax({
			url : "/project/student/delete",
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
		var userId = $("#updateItemForm .userId").val();
		var userName = $("#updateItemForm  .userName").val();
		var fullname = $("#updateItemForm  .fullname").val();
		var birthDate = $("#updateItemForm .birthDate").val();
		var email = $("#updateItemForm .email").val();
		var address = $("#updateItemForm  .address").val();
		var gender = $("#updateItemForm .genderBox").val();
		var state = $("#updateItemForm .stateBox").val();
		var phone = $("#updateItemForm .phone").val();
		$.ajax({
			url : "/project/student/update",
			type : "POST",
			data : {
				userId : userId,
				userName : userName,
				fullname : fullname,
				birthDate : birthDate,
				email : email,
				address : address,
				gender : gender,
				state : state,
				phone : phone
			},
			dataType : "JSON",
			success : function(response) {
			},
			complete : function() {
				displayTable();
				$("#updateItemForm .userName").val("");
				$("#updateItemForm .fullname").val("");
				$("#updateItemForm .birthDate").val("");
				$("#updateItemForm .address").val("");
				$("#updateItemForm .phone").val("");
				$("#updateItemForm .email").val("");
				$("#updateItemForm .email").val("");
				$("#updateItem").modal("hide");
			}
		});
	}
}

function changePass(id) {
	$("#changeModal").modal("show");
	$("#changeModalForm .userId").val(id);
}

function changePassProcess() {
	var userId = $("#changeModalForm .userId").val();
	var password = $("#changeModalForm .password").val();
	$.ajax({
		url : "/project/student/changePassword",
		type : "POST",
		data : {
			userId : userId,
			password : password,
		},
		dataType : "JSON",
		success : function(response) {
			if (response == true) {
				alert("Change password successfully");
			} else {
				alert("Change password fail");
			}
		},
		complete : function() {
			$("changeModalForm .password").val(" ");
			$("changeModalForm .confirmPassword").val(" ");
			$("#changeModal").modal("hide");
		}
	});

}
