$(function() {
	loadOpenHour();
	loadCloseHour();
	$('.combobox').selectpicker();
	$(".dateInput").datepicker();
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
	
	 $("#image").change(function(){
		  readUrl(this);
	  });
	  
	  $(".fileUpload").change(function(){
		  readUrl(this);
	  });
});

function insertItem() {
	if($("#newItemForm").valid()){
		var formData = new FormData($("#newItemForm")[0]);
		$.ajax({
			url : "/project/storePage/new",
			type : "POST",
			data : formData,
			contentType:false,
			processData:false,
			dataType : "JSON",
			success : function(response) {
				if (response == true) {
					alert("Insert successfully");
				}else{
					alert("Insert fail");
				}
			},
			complete:function(){
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

