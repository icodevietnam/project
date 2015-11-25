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
							<h2>Manage Notification</h2>
						</a>
						<h3>${countOverdue}</h3>
						<!-- <button data-toggle="modal" data-target="#newItem"class="btn btn-sm btn-primary">Create Notification</button> -->
						<div class="table-responsive">
							<table id="tblDepartment"
								class="table table-bordered table-hover table-striped">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/notification.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>