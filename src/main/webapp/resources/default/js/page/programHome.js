$(function() {
});
function joinProgram(stuId, code) {
	$
			.ajax({
				url : "/project/report/joinProgram",
				type : "POST",
				data : {
					stuId : stuId,
					code : code
				},
				dataType : "JSON",
				success : function(response) {
					if (response == true) {
						alert("Join Program successfully and save everything into system.");
					} else {
						alert("Join Program Fail or this student joined this program already.");
					}
				}
			});
}
