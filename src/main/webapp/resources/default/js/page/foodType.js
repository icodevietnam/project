$(function() {
	$('.combobox').selectpicker();
	displayTable();
	$('.imageDemo').attr('src',"/project/resources/default/images/no-image.jpg");
	$("#newItemForm").validate({
		rules : {
			name:{
				required:true
			},
			description:{
				required:true
			}
		},
		messages : {
			name:{
				required:"Name is not blank"
			},
			description:{
				required:"Description is not blank"
			}
		}
	});
	
	$("#updateItemForm").validate({
		rules : {
			name:{
				required:true
			},
			description:{
				required:true
			}
		},
		messages : {
			name:{
				required:"Name is not blank"
			},
			description:{
				required:"Description is not blank"
			}
		}
	});
	
	  $("#image").change(function(){
		  readUrl(this);
	  });
	  
	  $(".fileUpload").change(function(){
		  readUrl(this);
	  });
});

/*function showImage(id){
	var link ="";
	$.ajax({
		url : "/project/fileAttached/get",
		type : "GET",
		data : {
			itemId : id
		},
		async :false,
		cache : false,
		dataType : "JSON",
		success : function(response) {
			link = "<img class='thumbnail' src='/resources/default/images/"+ response.name+ "'/>"
		}
	});
	return link;
}*/

function displayTable() {
	var dataDepartments = [];
	$.ajax({
		url : "/project/foodType/getAll",
		type : "GET",
		dataType : "JSON",
		async :false,
		cache : false,
		success : function(response) {
			var i = 0;
			$.each(response, function(key, value) {
				i++;
				var parent;
				if(!value.foodType){
					parent = "None";
				}else{
					parent =value.foodType.name ;
				}
				dataDepartments.push([
						i,
						value.name,value.description,parent,
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
					"sTitle" : "Parent"
				},
				{
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
		url : "/project/foodType/get",
		type : "GET",
		data : {
			itemId : id
		},
		dataType : "JSON",
		success : function(response) {
			$("#updateItemForm .foodTypeId").val(response.id);
			$("#updateItemForm .foodTypeName").val(response.name);
			$("#updateItemForm .foodTypeDescription").val(response.description);
			if(!response.foodType){
				$("#updateItemForm .foodTypeBox").selectpicker('val',"0");
			}else{
				$("#updateItemForm .foodTypeBox").selectpicker('val',""+response.foodType.id +"");
			}
			$("#updateItem").modal("show");
		}
	});
}

function deleteItem(id) {
	if (confirm("Are you sure you want to proceed?") == true) {
		$.ajax({
			url : "/project/foodType/delete",
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
		var formData = new FormData($("#updateItemForm")[0]);
		$.ajax({
			url : "/project/foodType/update",
			type : "POST",
			data :formData ,
			contentType:false,
			processData:false,
			dataType : "JSON",
			success : function(response) {
			},
			complete:function(){
				displayTable();
				$("#updateItemForm .foodTypeName").val("");
				$("#updateItemForm .foodTypeDescription").val("");
				$("#updateItemForm .foodTypeBox").selectpicker('val',"0");
				$("#updateItem").modal("hide");
			}
		});
	}
}

function insertItem() {
	if($("#newItemForm").valid()){
		var formData = new FormData($("#newItemForm")[0]);
		$.ajax({
			url : "/project/foodType/new",
			type : "POST",
			data : formData,
			contentType:false,
			processData:false,
			dataType : "JSON",
			success : function(response) {
			},
			complete:function(){
				displayTable();
				$("#newItem").modal("hide");
				$("#foodTypeName").val(" ");
				$("#foodTypeDescription").val(" ");
				$('.imageDemo').attr('src',"/project/resources/default/images/no-image.jpg");
			}
		});
	}
}

function readUrl(input){
	 if (input.files && input.files[0]) {
         var reader = new FileReader();
         
         reader.onload = function (e) {
             $('.imageDemo').attr('src', e.target.result);
         }
         
         reader.readAsDataURL(input.files[0]);
     }
}
