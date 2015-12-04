<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<span id="storeId" class="hide">${store.id}</span>
		<div class="row" style="width:950px;margin-left: 30px;">
			<div class="col-lg-2">
				<img style="margin-top: 10px;" width="200px" src="${store.image.absolutelyPath}"> 
			</div>
			<div class="col-lg-8">
				<div class="food-title" style="margin-top:10px;margin-left:50px;height:50px;width: 100%;background: #000000;color:#FFFFFF;">
					<span style="display:block;margin-left:10px;font-weight: bold;" class='title'>${store.name}</span>
					<span style="display:block;margin-left:10px;" class='title'>${store.address} - ${store.storeType.name}</span>
				</div>
				<div class="food-content" style="margin-top:10px;margin-left:50px;;height:50px;width: 100%;">
					<span style="display:block;margin-left:10px;" class='title'>Address : ${store.address}</span>
					<span style="display:block;margin-left:10px;" class='title'>Phone : ${store.phone}</span>
					<span style="display:block;margin-left:10px;" class='title'>Hour : ${store.openHour} - ${store.closeHour}</span>
					<span style="display:block;margin-left:10px;" class='title'>Limit Price : ${store.priceLimit}</span>
					<span style="display:block;margin-left:10px;" class='title'>Comment Point : ${avgPoint}</span>
					<span style="display:block;margin-left:10px;" class='title'>Rate Point : ${avgPointRate}</span>
					<span style="display:block;margin-left:10px;color:red" class='title'>
					<c:choose><c:when test="${store.isConfirm}">Confirmed</c:when><c:otherwise>Is not confirmed</c:otherwise></c:choose></span>
					<c:if test="${currentUser != null}">
					<button class="btn btnPrimary" data-toggle="modal"
								data-target="#ratingModal" type="button">Rate</button>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row" style="width:950px;margin-left: 50px;">
			<h3>Store Description</h3>
			<div class="description">
				${store.description}
			</div>
		</div>
		<div class="row" style="margin-top:10px;width:930px;margin-left: 50px;border:1px #000000 dotted;">
			<h3>Comment</h3>
			<div class="comment-content">
			</div>
		</div>
		<c:if test="${currentUser != null}">
		<div class="row" style="margin-top:10px;width:930px;margin-left: 50px;border:1px #000000 dotted;">
			<h3>Add Comment</h3>
			<div class="content">
				<form id="addCommentForm" class="form-horizontal">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Title</label>
						<div class="col-sm-10">
						<input type="text" class="form-control" id="titleStore" name="title">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Content</label>
						<div class="col-sm-10">
						<textarea class="form-control" id="content"
										name="content"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Point</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="point" name="point">
						</div>
					</div>
					<button type="button" style="margin-left: 50px;margin-bottom: 20px;" onclick="comment()" class="btn btn-primary">Comment</button>
				</form>
			</div>
		</div>
		</c:if>
		<div class="row" style="width: 950px;margin-left: 50px;">
			<h4 style="margin-left: 5px; font-size: 13px;font-weight: bold;">Food in '${store.name}'</h4>
			<c:forEach var="food" items="${store.listFoods}">
				<div class='col-lg-3'>
					<a href="<c:url value='/food/${food.id}'/>" ><img style="margin-top: 10px;" width="150px" src="${food.image.absolutelyPath}"> </a> 
					<span class="district-title" style="display:block;color:blue;font-weight: bold;font-size: 11px;">${food.name}</span>
				</div>
			</c:forEach>
		</div>
		<div class="modal fade" id="ratingModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="student">
			<div class="modal-content">
				<form id="ratingForm" action="<c:url value='/member/login'/>" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Rating</h4>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<input id="numberPoint"
								type="number" class="form-control" name="point" value="">
						</div>
					</div>
					<span class="errot">${message}</span>
					<div class="modal-footer">
						<button type="button" onclick="rating()" class="btn btn-primary">Rate</button>
					</div>
				</form>
			</div>
		</div>
	</div>
		<script src="<c:url value='/resources/default/js/page/storeHome.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

