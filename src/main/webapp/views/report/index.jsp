<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="col-lg-8">
				<div class="ibox">
					<div class="ibox-content">
						<a href="<c:url value='/admin/report/list'/>" class="btn-link">
							<h2>Manage Report</h2>
						</a>
						<h3>${countOverdue}</h3>
						<!-- <button data-toggle="modal" data-target="#newItem"class="btn btn-sm btn-primary">Create Report</button> -->
						<div class="table-responsive">
							<table id="tblDepartment"
								class="table table-bordered table-hover table-striped">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="newItem" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="report">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Add Report</h4>
					</div>
					<form id="newItemForm" class="form-horizontal" action="<c:url value='/admin/report/new'/>" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
							<input type="text" class="form-control" id="reportName" name="name" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Description</label>
							<div class="col-sm-10">
							<input type="text" class="form-control" id="reportDescription" name="description" >
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="insertItem();" class="btn btn-primary">Save</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<div class="modal fade" id="updateItem" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="report">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Edit Report</h4>
					</div>
					<form id="updateItemForm" class="form-horizontal" action="<c:url value='/admin/profile/updateProfile'/>" method="POST">
					<div class="modal-body">
								<input type="text" class="reportId form-control hide" class="reportId" name="reportId" >
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">Name</label>
									<div class="col-sm-10">
										<input type="text" class="reportName form-control" class="reportName" name="name" >
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">Description</label>
									<div class="col-sm-10">
										<input type="text" class="reportDescription form-control" class="reportDescription" name="description" >
									</div>
								</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="editedItem();" class="btn btn-primary">Edit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/report.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>