$(function() {
	displayTable();
	$('.imageDemo').attr('src',"/project/resources/default/images/no-image.jpg");
	$("#newItemForm").validate({
		rules : {
			name:{
				required:true
			},
			description:{
				required:true
			},
			address:{
				required:true
			},
			priceLimit:{
				required:true
			},
			phone : {
				required:true
			}
		},
		messages : {
			name:{
				required:"Name is not blank"
			},
			description:{
				required:"Description is not blank"
			},
			address:{
				required:"Address is not blank"
			},
			priceLimit:{
				required:"PriceLimit is not blank"
			},
			phone : {
				required:"phone is not blank"
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
			},
			address:{
				required:true
			},
			priceLimit:{
				required:true
			},
			phone : {
				required:true
			}
		},
		messages : {
			name:{
				required:"Name is not blank"
			},
			description:{
				required:"Description is not blank"
			},
			address:{
				required:"Address is not blank"
			},
			priceLimit:{
				required:"PriceLimit is not blank"
			},
			phone : {
				required:"phone is not blank"
			}
		}
	});
	
	loadOpenHour();
	loadCloseHour();
	$('.combobox').selectpicker();
	
	  $("#image").change(function(){
		  readUrl(this);
	  });
	  
	  $(".fileUpload").change(function(){
		  readUrl(this);
	  });
});

function displayTable() {
	var dataDepartments = [];
	$.ajax({
		url : "/project/store/getAll",
		type : "GET",
		dataType : "JSON",
		async :false,
		cache : false,
		success : function(response) {
			var i = 0;
			$.each(response, function(key, value) {
				i++;
				var parent;
				if(!value.store){
					parent = "None";
				}else{
					parent =value.store.name ;
				}
				dataDepartments.push([
						i,
						value.name,value.address,value.district.name,value.storeType.name,
						"<img width='200px' alt='"+value.image.name+"' src='"+value.image.absolutelyPath+"' />",
						value.isConfirm == true ? 'Is Confirmed' : "<button class='btn btn-sm btn-primary' onclick='confirmItem("
							+ value.id + ")' >Set Confirm</button>",
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
					"sTitle" : "Address"
				}, {
					"sTitle" : "District"
				}, {
					"sTitle" : "Type"
				},{
					"sTitle" : "Image"
				},{
					"sTitle" : "Confirm"
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
		url : "/project/store/get",
		type : "GET",
		data : {
			itemId : id
		},
		dataType : "JSON",
		success : function(response) {
			$("#updateItemForm .storeId").val(response.id);
			$("#updateItemForm .storeName").val(response.name);
			$("#updateItemForm .storeAddress").val(response.address);
			$("#updateItemForm .storePhone").val(response.phone);
			$("#updateItemForm .storePriceLimit").val(response.priceLimit);
			tinyMCE.activeEditor.setContent(response.description);
			$("#updateItemForm .openHourBox").selectpicker('val',""+response.openHour +"");
			$("#updateItemForm .closeHourBox").selectpicker('val',""+response.closeHour +"");
			$("#updateItemForm .districtBox").selectpicker('val',response.district.id);
			$("#updateItemForm .storeTypeBox").selectpicker('val',response.storeType.id);
			$('.imageDemo').attr('src', response.image.absolutelyPath);
			$("#updateItem").modal("show");
		}
	});
}

function deleteItem(id) {
	if (confirm("Are you sure you want to proceed?") == true) {
		$.ajax({
			url : "/project/store/delete",
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

function confirmItem(id){
	$.ajax({
		url : "/project/store/confirm",
		type : "POST",
		data :{
			id :id
		},
		dataType : "JSON",
		success : function(response) {
			displayTable();
		},
	});
}

function editedItem() {
	var currentId = $("#updateItemForm .storeId").val();
	var parentId = $("#updateItemForm .storeBox").val();
	if($("#updateItemForm").valid()){
		var formData = new FormData($("#updateItemForm")[0]);
		$.ajax({
			url : "/project/store/update",
			type : "POST",
			data :formData ,
			contentType:false,
			processData:false,
			dataType : "JSON",
			success : function(response) {
			},
			complete:function(){
				displayTable();
				$("#updateItemForm .storeName").val("");
				$("#updateItemForm .storeDescription").val("");
				$("#updateItemForm .storeAddress").val(" ");
				$("#updateItemForm .storePhone").val(" ");
				$("#updateItemForm .openHourBox").selectpicker('val',"0");
				$("#updateItemForm .closeHourBox").selectpicker('val',"0");
				$("#updateItemForm .districtBox").selectpicker('val',"0");
				$("#updateItemForm .storeTypeBox").selectpicker('val',"0");
				$("#updateItem").modal("hide");
			}
		});
	}
}

function insertItem() {
	if($("#newItemForm").valid()){
		var formData = new FormData($("#newItemForm")[0]);
		$.ajax({
			url : "/project/store/new",
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
				$("#storeName").val("");
				$("#storeDescription").val("");
				$("#storeAddress").val(" ");
				$("#storePhone").val(" ");
				$("#openHourBox").selectpicker('val',"0");
				$("#closeHourBox").selectpicker('val',"0");
				$("#districtBox").selectpicker('val',"0");
				$("#storeTypeBox").selectpicker('val',"0");
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

function loadOpenHour(){
	for(var i = 1;i<=12;i++){
		$("#openHourBox").append("<option value='"+i+":00AM'>"+ i+":00AM" +"</option>")
		$(".openHourBox").append("<option value='"+i+":00AM'>"+ i+":00AM" +"</option>")
	}
	for(var i = 1;i<=12;i++){
		$("#openHourBox").append("<option value='"+i+":00PM'>"+ i+":00PM" +"</option>")
		$(".openHourBox").append("<option value='"+i+":00PM'>"+ i+":00PM" +"</option>")
	}
	//$('.combobox').selectpicker('refresh');
}
function loadCloseHour(){
	for(var i = 1;i<=12;i++){
		$("#closeHourBox").append("<option value='"+i+":00AM'>"+ i+":00AM" +"</option>");
		$(".closeHourBox").append("<option value='"+i+":00AM'>"+ i+":00AM" +"</option>");
	}
	for(var i = 1;i<=12;i++){
		$("#closeHourBox").append("<option value='"+i+":00PM'>"+ i+":00PM" +"</option>");
		$(".closeHourBox").append("<option value='"+i+":00PM'>"+ i+":00PM" +"</option>");
	}
	//$('.combobox').selectpicker('refresh');
}
