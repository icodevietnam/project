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
						<a href="<c:url value='/admin/user/list'/>" class="btn-link">
							<h2>Manage Student</h2>
						</a>
						<button data-toggle="modal" data-target="#newItem"class="btn btn-sm btn-primary">Create
							new</button>
						<div class="table-responsive">
							<table id="tblUser"
								class="table table-bordered table-hover table-striped">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="newItem" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Add User</h4>
					</div>
					<form id="newItemForm" class="form-horizontal" action="<c:url value='/admin/user/new'/>" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Username</label>
							<div class="col-sm-10">
							<input type="text" class="form-control" id="userName" name="userName" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" name="password" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Confirm password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" >
							</div>
						</div>
						<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">Gender</label>
								<div class="col-sm-10">
									<select id="genderBox" class="combobox form-control" data-style="btn-white" name="genderBox">
										<option value="true">Male</option>
										<option value="false">Female</option>
									</select>
								</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Fullname</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="fullname" name="fullname" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Birth date</label>
							<div class="col-sm-10">
								<input type="text" class="dateInput form-control" id="birthDate" name="birthDate" data-date-format="dd/mm/yyyy" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="email" name="email" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Address</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="address" name="address" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Phone</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="phone" name="phone" >
							</div>
						</div>
						<div class="form-group">
								<label for="state" class="col-sm-2 control-label">State</label>
								<div class="col-sm-10">
									<select id="stateBox" class="combobox form-control" name="stateBox" data-style="btn-white">
										<option value="active">Active</option>
										<option value="absent">Absent</option>
										<option value="resign">Resign</option>
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
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Edit User</h4>
					</div>
					<form id="updateItemForm" class="form-horizontal" action="<c:url value='/admin/profile/updateProfile'/>" method="POST">
					<div class="modal-body">
								<input type="text" class="userId form-control hide" id="userId" name="userId" >
								<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Username</label>
							<div class="col-sm-10">
							<input type="text" disabled="disabled" class="userName form-control" id="userName" name="userName" >
							</div>
						</div>
						<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">Gender</label>
								<div class="col-sm-10">
									<select id="genderBox" class="genderBox combobox form-control" data-style="btn-white" name="gender">
										<option value="true">Male</option>
										<option value="false">Female</option>
									</select>
								</div>
							</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Username</label>
							<div class="col-sm-10">
								<input type="text" class="fullname form-control" id="fullname" name="fullname" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Birthdate</label>
							<div class="col-sm-10">
								<input type="text" class="birthDate dateInput form-control" id="birthDate" name="birthDate" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="email form-control" id="email" name="email" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Address</label>
							<div class="col-sm-10">
								<input type="text" class="address form-control" id="address" name="address" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Phone</label>
							<div class="col-sm-10">
								<input type="number" class="phone form-control" id="phone" name="phone" >
							</div>
						</div>
						<div class="form-group">
								<label for="state" class="col-sm-2 control-label">State</label>
								<div class="col-sm-10">
									<select id="stateBox" class="stateBox combobox form-control" name="stateBox" data-style="btn-white">
										<option value="active">Active</option>
										<option value="absent">Absent</option>
										<option value="resign">Resign</option>
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
		<div class="modal fade" id="changeModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Change Password</h4>
					</div>
					<form id="changeModalForm" class="form-horizontal" action="<c:url value='/admin/user/new'/>" method="POST">
					<input type="text" class="userId form-control hide" id="userId" name="userId" >
					<div class="modal-body">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="password" class="password form-control" id="password" name="password" >
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Confirm Password</label>
							<div class="col-sm-10">
								<input type="password" class="confirmPassword form-control" id="confirmPassword" name="confirmPassword" >
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="changePassProcess();" class="btn btn-primary">Change password</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/student.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>