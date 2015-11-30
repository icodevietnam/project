$(function() {
	displayTable();
});

/*
 * function showImage(id){ var link =""; $.ajax({ url :
 * "/project/fileAttached/get", type : "GET", data : { itemId : id }, async :false,
 * cache : false, dataType : "JSON", success : function(response) { link = "<img
 * class='thumbnail' src='/resources/default/images/"+ response.name+ "'/>" }
 * }); return link; }
 */

function displayTable() {
	var dataDepartments = [];
	$
			.ajax({
				url : "/project/report/getAll",
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
														value.student.username,
														value.student.fullName,
														value.program.code,
														value.program.name,
														new Date(
																value.createDate),
														value.isOverdue == true ?"<span style='font-weight:bold;color:red;' >Yes</span>"  :"<span style='font-weight:bold;color:blue;' >None</span>",
														value.isApproved == true ? "<span style='font-weight:bold;color:red;' >Is Approved</span>"
																: "<button class='btn btn-sm btn-danger' onclick='setApprove("
																		+ value.id
																		+ ")' >Approve</button>" ]);
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
							"sTitle" : "Username"
						}, {
							"sTitle" : "Full Name"
						}, {
							"sTitle" : "Program Code"
						}, {
							"sTitle" : "Program Name"
						}, {
							"sTitle" : "Created Date"
						}, {
							"sTitle" : "Overdued"
						} , {
							"sTitle" : "Approved"
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

