<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${student != null }">
	<c:redirect url="/accessDenied" />
</c:if>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="col-lg-11">
				<form id="newItemForm" class="form-horizontal"
					action="<c:url value='/admin/user/new'/>" method="POST">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Username</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userName"
								name="userName">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								name="password">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Confirm
							password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="confirmPassword"
								name="confirmPassword">
						</div>
					</div>
					<div class="form-group">
						<label for="gender" class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-10">
							<select id="genderBox" class="combobox form-control"
								data-style="btn-white" name="genderBox">
								<option value="true">Male</option>
								<option value="false">Female</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Fullname</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="fullname"
								name="fullname">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Birth
							date</label>
						<div class="col-sm-10">
							<input type="text" class="dateInput form-control" id="birthDate"
								name="birthDate" data-date-format="dd/mm/yyyy">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email" name="email">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="address"
								name="address">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Phone</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="phone" name="phone">
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-2 control-label">State</label>
						<div class="col-sm-10">
							<select id="stateBox" class="combobox form-control"
								name="stateBox" data-style="btn-white">
								<option value="active">Active</option>
								<option value="absent">Absent</option>
								<option value="resign">Resign</option>
							</select>
						</div>
					</div>
					<button type="button" onclick="insertItem();"
						class="btn btn-primary">Save</button>
				</form>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/registerHome.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

