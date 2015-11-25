<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox">
					<div class="ibox-content">
						<a href="<c:url value='/admin/program/list'/>" class="btn-link">
							<h2>Manage Program</h2>
						</a>
						<button data-toggle="modal" data-target="#newItem"class="btn btn-sm btn-primary">Create Program</button>
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
			<div class="modal-dialog" role="program">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Add Program</h4>
					</div>
					<form id="newItemForm" class="form-horizontal" action="<c:url value='/admin/program/new'/>" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
							<input type="text" class="form-control" id="programName" name="name" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Description</label>
							<div class="col-sm-10">
							<textarea type="text" class="form-control" id="programDescription" name="description"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="faculty" class="col-sm-2 control-label">Faculty</label>
							<div class="col-sm-10">
								<select id="facultyBox" name="facultyBox" class="form-control combobox" data-style="btn-white">
									<c:forEach var="faculty" items="${listFaculties}">
										<option value="${faculty.id}">${faculty.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="programerLeader" class="col-sm-2 control-label">Programer Leader</label>
							<div class="col-sm-10">
								<select id="plBox" name="plBox" class="form-control combobox" data-style="btn-white">
									<option value="none">No selected</option>
									<c:forEach var="pl" items="${listUsersPL}">
										<option value="${pl.id}">${pl.fullName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="programerLeader" class="col-sm-2 control-label">External Examiner</label>
							<div class="col-sm-10">
								<select id="eeBox" name="eeBox" class="form-control combobox" data-style="btn-white">
									<option value="none">No selected</option>
									<c:forEach var="ee" items="${listUsersEE}">
										<option value="${ee.id}">${ee.fullName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Grade</label>
							<div class="col-sm-10">
							<input type="number" class="form-control" id="grade" name="grade" >
							</div>
						</div>
						<div class="form-group">
								<label for="conduct" class="col-sm-2 control-label">Conduct</label>
								<div class="col-sm-10">
									<select id="conductBox" class="conductBox combobox form-control" data-style="btn-white" name="conductBox">
										<option value="best">Best</option>
										<option value="good">Good</option>
										<option value="normal">Normal</option>
										<option value="bad">Bad</option>
									</select>
								</div>
						</div>
						<div class="form-group">
							<label for="programerLeader" class="col-sm-2 control-label">Academic Year</label>
							<div class="col-sm-10">
								<select id="yearBox" name="yearBox" class="form-control combobox" data-style="btn-white">
									<c:forEach var="year" items="${listYear}">
										<option value="${year}">${year}</option>
									</c:forEach>
								</select>
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
			<div class="modal-dialog" role="program">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Update Program</h4>
					</div>
					<form id="updateItemForm" class="form-horizontal" action="<c:url value='/admin/program/new'/>" method="POST">
					<div class="modal-body">
						<input type="text" class="itemId form-control hide" class="itemId" name="itemId" >
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
							<input type="text" class="programName form-control" id="programName" name="name" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Description</label>
							<div class="col-sm-10">
							<textarea type="text" class="programDescription form-control" id="programDescription" name="description"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="faculty" class="col-sm-2 control-label">Faculty</label>
							<div class="col-sm-10">
								<select id="facultyBox" name="facultyBox" class="form-control combobox" data-style="btn-white">
									<c:forEach var="faculty" items="${listFaculties}">
										<option value="${faculty.id}">${faculty.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="programerLeader" class="col-sm-2 control-label">Programer Leader</label>
							<div class="col-sm-10">
								<select id="plBox" name="plBox" class="form-control combobox" data-style="btn-white">
									<c:forEach var="pl" items="${listUsersPL}">
										<option value="${pl.id}">${pl.fullName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="programerLeader" class="col-sm-2 control-label">External Examiner</label>
							<div class="col-sm-10">
								<select id="eeBox" name="eeBox" class="form-control combobox" data-style="btn-white">
									<c:forEach var="ee" items="${listUsersEE}">
										<option value="${ee.id}">${ee.fullName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Grade</label>
							<div class="col-sm-10">
							<input type="number" class="grade form-control" id="grade" name="grade" >
							</div>
						</div>
						<div class="form-group">
								<label for="conduct" class="col-sm-2 control-label">Conduct</label>
								<div class="col-sm-10">
									<select id="conductBox" class="conductBox combobox form-control" data-style="btn-white" name="conductBox">
										<option value="best">Best</option>
										<option value="good">Good</option>
										<option value="normal">Normal</option>
										<option value="bad">Bad</option>
									</select>
								</div>
						</div>
						<div class="form-group">
							<label for="programerLeader" class="col-sm-2 control-label">Academic Year</label>
							<div class="col-sm-10">
								<select id="yearBox" name="yearBox" class="form-control combobox" data-style="btn-white">
									<c:forEach var="year" items="${listYear}">
										<option value="${year}">${year}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="editedItem();" class="btn btn-primary">Update</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/program.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>