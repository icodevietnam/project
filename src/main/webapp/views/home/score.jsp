<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${student == null }">
	<c:redirect url="/accessDenied" />
</c:if>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="col-lg-11">
				<c:if test="${student.certificated == null }">
					<form id="newItemForm" class="form-horizontal"
						action="<c:url value='/admin/score/new'/>" method="POST">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Math</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="math" name="math">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Literity</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="literity"
									name="literity">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Chemistry</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="chemistry"
									name="chemistry">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">English</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="english"
									name="english">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Physical</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="physical"
									name="physical">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Biological</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="biological"
									name="biological">
							</div>
						</div>
						<div class="form-group">
							<label for="conduct" class="col-sm-2 control-label">Conduct</label>
							<div class="col-sm-10">
								<select id="conductBox" class="conductBox combobox form-control"
									data-style="btn-white" name="conductBox">
									<option value="best">Best</option>
									<option value="good">Good</option>
									<option value="normal">Normal</option>
									<option value="bad">Bad</option>
								</select>
							</div>
						</div>
						<button type="button" onclick="insertItem();"
							class="btn btn-primary">Save</button>
					</form>
				</c:if>
				<c:if test="${student.certificated != null }">
					<div class="col-lg-7">
						<ul class="list-group">
							<li class="list-group-item">Math : ${student.certificated.math}</li>
							<li class="list-group-item">English : ${student.certificated.english}</li>
							<li class="list-group-item">Literity : ${student.certificated.literity}</li>
							<li class="list-group-item">Chemistry : ${student.certificated.chemistry}</li>
							<li class="list-group-item">Physical : ${student.certificated.physical}</li>
							<li class="list-group-item">Biological${student.certificated.biological}</li>
							<li class="list-group-item">Conduct : ${student.certificated.conduct}</li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
		<script src="<c:url value='/resources/default/js/page/scoreHome.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

