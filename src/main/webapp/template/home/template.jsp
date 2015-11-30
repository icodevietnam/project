<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${title}</title>
<link href="<c:url value='/resources/default/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/default/css/bootstrap-theme.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/default/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/default/css/plugins/toastr/toastr.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/resources/default/css/animate.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/default/css/dataTables.bootstrap.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/default/css/bootstrap-select.css'/>"
	rel="stylesheet">
<link href="<c:url value='/resources/default/css/datepicker.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/default/css/bootstrap-select.css'/>"
	rel="stylesheet">
<link href="<c:url value='/resources/default/css/datepicker.css'/>"
	rel="stylesheet">
<link href="<c:url value='/resources/default/css/notepad.css'/>"
	rel="stylesheet">
<script src="<c:url value='/resources/default/js/jquery-2.1.1.js'/>"></script>
<script src="<c:url value='/resources/default/js/bootstrap-select.js'/>"></script>
<script
	src="<c:url value='/resources/default/js/bootstrap-datepicker.js'/>"></script>
<script
	src="<c:url value='/resources/default/js/jquery.dataTables.js'/>"></script>
<script
	src="<c:url value='/resources/default/js/dataTables.bootstrap.js'/>"></script>
<script src="<c:url value='/resources/default/js/jquery.validate.js'/>"></script>
<script
	src="<c:url value='/resources/default/js/bootstrap-datepicker.js'/>"></script>
<script src="<c:url value='/resources/default/js/bootstrap-select.js'/>"></script>
</head>
<body>
	<div id="top"></div>
	<div id="header">
		<span class='title-text'>FoodyVN</span>
	</div>
	<div id="navigation">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<c:url value='/home'/>">Home</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<c:if test="${student == null}">
							<li><a href="<c:url value='/register'/>">Register</a></li>
							<li><a href="#" data-toggle="modal"
								data-target="#loginModal">Login</a></li>
						</c:if>
						<c:if test="${student != null}">
							<li><a href="<c:url value='/member/score'/>">Score &
									Conduct</a></li>
						</c:if>
						<c:forEach var="faculty" items="${listFaculties}">
							<li><a href="<c:url value='/program/${faculty.id}'/>">${faculty.name}</a></li>
						</c:forEach>
						<c:if test="${student != null}">
							<li><a href="<c:url value='/member/logout'/>">Log Out
									[${student.fullName}]</a></li>
						</c:if>
						<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li> -->
					</ul>
					<!-- <form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form> -->
					<!-- <ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul> -->
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<div id="box">
		<div id="header">
			<span class="error">${message}</span>
			<h1>${title}</h1>
		</div>
		<!--TOP NAVIGATION-->
		<%-- <tiles:insertAttribute name="navigation" /> --%>
		<!--MAIN CONTENT-->
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<!--FOOTER-->
		<tiles:insertAttribute name="footer" />
	</div>
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="student">
			<div class="modal-content">
				<form action="<c:url value='/member/login'/>" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Login Student</h4>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="username"
								type="text" class="form-control" name="username" value=""
								placeholder="Username">
						</div>

						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name="password"
								placeholder="Password">
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
					<span class="errot">${message}</span>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Mainly scripts -->
	<script src="<c:url value='/resources/default/js/bootstrap.min.js'/>"></script>
	<script
		src="<c:url value='/resources/default/js/plugins/metisMenu/jquery.metisMenu.js'/>"></script>
	<script
		src="<c:url value='/resources/default/js/plugins/slimscroll/jquery.slimscroll.min.js'/>"></script>
	<!-- Custom and plugin javascript -->
	<script src="<c:url value='/resources/default/js/inspinia.js'/>"></script>
	<script src="<c:url value='/resources/default/js/utils.js'/>"></script>
	<script
		src="<c:url value='/resources/default/js/plugins/pace/pace.min.js'/>"></script>
</body>
</html>