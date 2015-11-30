$(function() {
	$('.combobox').selectpicker();
	$(".dateInput").datepicker();
	
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
				remote : "The Username is existed."
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
				if (response == true) {
					alert("Insert successfully");
				}else{
					alert("Insert fail");
				}
			},
			complete : function() {
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

