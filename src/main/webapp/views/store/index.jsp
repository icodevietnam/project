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
						<a href="<c:url value='/admin/store/list'/>" class="btn-link">
							<h2>Manage Store</h2>
						</a>
						<button data-toggle="modal" data-target="#newItem"
							class="btn btn-sm btn-primary">Create Store</button>
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
			<div class="modal-dialog modal-lg" role="store">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Add Store</h4>
					</div>
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
							<label for="role" class="col-sm-2 control-label">Food Type</label>
							<div class="col-sm-10">
								<select id="storeBox" name="storeBox" class="form-control combobox" data-style="btn-white">
									<option value="0">No Parent</option>
									<c:forEach var="store" items="${listParent}">
										<option value="${store.id}">${store.name}</option>
									</c:forEach>
								</select>
							</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Store Type</label>
								<div class="col-sm-10">
									<select id="storeTypeBox" name="storeTypeBox" class="storeTypeBox form-control combobox" data-style="btn-white">
										<option value="0">Store Type</option>
										<option value="1">Food Type</option>
									</select>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onclick="insertItem();"
								class="btn btn-primary">Save</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="modal fade" id="updateItem" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="store">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Edit Store</h4>
					</div>
					<form id="updateItemForm" class="form-horizontal"
						action="<c:url value='/admin/profile/updateProfile'/>"
						method="POST">
						<div class="modal-body">
							<input type="text" class="storeId form-control hide"
								class="storeId" name="storeId">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="storeName form-control"
										 name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Description</label>
								<div class="col-sm-10">
									<input type="text" class="storeDescription form-control"
										 name="description">
								</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Food Type</label>
								<div class="col-sm-10">
									<select name="storeBox" class="storeBox form-control combobox" data-style="btn-white">
										<option value="0">No Parent</option>
										<c:forEach var="store" items="${listParent}">
											<option value="${store.id}">${store.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Store Type</label>
								<div class="col-sm-10">
									<select name="storeTypeBox" class="storeTypeBox form-control combobox" data-style="btn-white">
										<option value="0">Store Type</option>
										<option value="1">Food Type</option>
									</select>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onclick="editedItem();"
								class="btn btn-primary">Edit</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="<c:url value='/resources/default/js/page/store.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>