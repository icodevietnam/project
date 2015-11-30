$(function() {
	displayTable();
});

function displayTable() {
	var dataDepartments = [];
	$
			.ajax({
				url : "/project/notification/getAll",
				type : "GET",
				dataType : "JSON",
				async : false,
				cache : false,
				success : function(response) {
					var i = 0;
					$
							.each(
									response,
									function(key, value) {
										i++;
										dataDepartments
												.push([
														i,
														value.name,
														value.content,
														]);
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
							"sTitle" : "Content"
						}]
					});
				}
			});
}

function setApprove(id){
	$.ajax({
		url : "/project/report/setApprove",
		type : "POST",
		data : {
			reportId : id
		},
		dataType : "JSON",
		success : function(response) {
		},
		complete : function() {
			displayTable();
		}
	});
}

