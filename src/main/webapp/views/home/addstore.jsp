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
						action="<c:url value='/admin/store/new'/>" method="POST">
						<div class="modal-body">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="storeName" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Description</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="storeDescription"
										name="description"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Address</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="storeAddress" name="address">
								</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Open Hour</label>
								<div class="col-sm-10">
									<select id="openHourBox" name="openHourBox" class="form-control combobox" data-style="btn-white">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Close Hour</label>
								<div class="col-sm-10">
									<select id="closeHourBox" name="closeHourBox" class="form-control combobox" data-style="btn-white">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Price Limit</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="storePriceLimit" name="priceLimit">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Phone</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="storePhone" name="phone">
								</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">District</label>
								<div class="col-sm-10">
									<select name="districtBox" class="districtBox form-control combobox" data-style="btn-white">
										<c:forEach var="district" items="${listDistricts}">
											<option value="${district.id}">${district.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Store Type</label>
								<div class="col-sm-10">
									<select name="storeTypeBox" class="storeTypeBox form-control combobox" data-style="btn-white">
										<c:forEach var="storeType" items="${listStoreTypes}">
											<option value="${storeType.id}">${storeType.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Image</label>
								<div class="col-sm-10">
									<input type="file" class="form-control" id="image" name="image">
									<img width="200px" class="imageDemo" src="#" />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button style="margin-left: 50px;" type="button" onclick="insertItem();"
								class="btn btn-primary">Save</button>
						</div>
					</form>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/addStoreHome.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

