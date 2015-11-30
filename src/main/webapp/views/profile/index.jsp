<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="col-lg-6">
				<div class="ibox">
					<div class="ibox-content">
						<a href="<c:url value='/admin/profile'/>" class="btn-link">
							<h2>Profile Information</h2>
						</a>
						<div class="form-horizontal">
							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">Username</label>
								<div class="col-sm-10">
									<label for="username" class="col-sm-5 control-label">${currentUser.username}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="fullname" class="col-sm-2 control-label">Full name</label>
								<div class="col-sm-10">
									<label for="fullname" class="col-sm-5 control-label">${currentUser.fullName}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="birthDate" class="col-sm-2 control-label">Birth Date</label>
								<div class="col-sm-10">
									<label for="birthDate" class="col-sm-5 control-label">${currentUser.birthDate}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">Gender</label>
								<div class="col-sm-10">
									<label for="gender" class="col-sm-5 control-label">
										<c:choose>
											<c:when test="${currentUser.gender == true}">
												Male
											</c:when>
											<c:otherwise>
												Female
											</c:otherwise>
										</c:choose>
									</label>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">Address</label>
								<div class="col-sm-10">
									<label for="address" class="col-sm-5 control-label">${currentUser.address}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-sm-2 control-label">Phone</label>
								<div class="col-sm-10">
									<label for="phone" class="col-sm-5 control-label">${currentUser.phone}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="state" class="col-sm-2 control-label">State</label>
								<div class="col-sm-10">
									<label for="state" class="col-sm-5 control-label">
										<c:choose>
											<c:when test="${currentUser.state == 'active'}">
												Active
											</c:when>
											<c:when test="${currentUser.state == 'absent'}">
												Absent
											</c:when>
											<c:otherwise>
												Resign
											</c:otherwise>
										</c:choose>
									</label>
								</div>
							</div>
							<div class="form-group">
    							<div class="col-sm-2">
      								<button type="button" onclick="displayChangeInfo();" class="btn btn-sm btn btn-primary">Change Infomation</button>
    							</div>
  							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="changeInfo" class="col-lg-6">
				<div class="ibox">
					<div class="ibox-content">
						<a class="btn-link">
							<h2>Change User Infomation</h2>
						</a>
						<form id="changeInfoForm" class="form-horizontal" action="<c:url value='/admin/profile/updateProfile'/>" method="POST">
							<input type="text" value="${currentUser.id}" class="form-control hide" id="id" name="id" >
							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">Username</label>
								<div class="col-sm-10">
									<input type="text" disabled="disabled" value="${currentUser.username}" class="form-control" id="username" name="username" >
								</div>
							</div>
							<div class="form-group">
								<label for="fullname" class="col-sm-2 control-label">Fullname</label>
								<div class="col-sm-10">
									<input type="text" value="${currentUser.fullName}" class="form-control" id="fullname" name="fullname" >
								</div>
							</div>
							<div class="form-group">
								<label for="birthDate" class="col-sm-2 control-label">Birth Date</label>
								<div class="col-sm-10">
									<input type="text" value="${currentUser.birthDate}" class="form-control" id="birthdate" name="birthdate" data-date-format="dd/mm/yyyy" >
								</div>
							</div>
							<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">Gender</label>
								<div class="col-sm-10">
									<select id="genderBox" class="combobox form-control" data-style="btn-white" name="gender">
										<option value="true">Male</option>
										<option value="false">Female</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">Address</label>
								<div class="col-sm-10">
									<input type="text" value="${currentUser.address}" class="form-control" id="address" name="address" >
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-sm-2 control-label">Phone</label>
								<div class="col-sm-10">
									<input type="number" value="${currentUser.phone}" class="form-control" id="phone" name="phone" >
								</div>
							</div>
							<div class="form-group">
								<label for="state" class="col-sm-2 control-label">State</label>
								<div class="col-sm-10">
									<select id="stateBox" class="combobox form-control" name="state" data-style="btn-white">
										<option value="active">Active</option>
										<option value="absent">Absent</option>
										<option value="resign">Resign</option>
									</select>
								</div>
							</div>
							<div class="form-group">
    							<div class="col-sm-5">
      								<button type="submit" class="btn btn-sm btn btn-primary">Change Infomation</button>
    							</div>
  							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="<c:url value='/resources/default/js/page/profile.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>