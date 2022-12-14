<%@page import="model.AccountRole"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>

<body>
	<div class="container">
		<core:if test="${loginError != null}">
			<script>
				/*     window.addEventListener("load",function(){
				 alert("${loginError}");
				 }) */
				alert("${loginError}");
			</script>
		</core:if>
		<core:if test="${sessionScope.updateSuccess != null}">
			<script>
				/*     window.addEventListener("load",function(){
				 alert("${loginError}");
				 }) */
				alert("${sessionScope.updateSuccess}");
			</script>
			<%
			request.getSession().removeAttribute("updateSuccess");
			%>
		</core:if>
		<core:if test="${sessionScope.insertSuccess != null}">
			<script>
				/*     window.addEventListener("load",function(){
				 alert("${loginError}");
				 }) */
				alert("${sessionScope.insertSuccess}");
			</script>
			<%
			request.getSession().removeAttribute("insertSuccess");
			%>
		</core:if>
		<div class="row justify-content-center">
			<div class="row">
				<core:choose>
					<core:when test="${sessionScope.userLogin != null }">
						<div class="col">
							<p class=" d-inline">
								<i class="bi bi-person-circle me-3"></i>User :
								${sessionScope.userLogin }
							</p>
							<core:if test="${sessionScope.role == AccountRole.USER }">
								<h5  class=" d-inline">
									<span class="badge bg-danger">User </span>
								</h5>
							</core:if>
							<core:if test="${sessionScope.role == AccountRole.ADMIN }">
								<h5  class=" d-inline">
									<span class="badge bg-danger">Admin </span>
								</h5>
							</core:if>


						</div>
						<div class="col">
							<a class="btn btn-primary"
								href="${pageContext.request.contextPath}/logout">????ng xu???t</a>
						</div>
					</core:when>
					<core:otherwise>
						<div class="col"></div>
						<div class="col">
							<a class="btn btn-primary"
								href="${pageContext.request.contextPath}/login">????ng nh???p</a>
						</div>
					</core:otherwise>
				</core:choose>

			</div>
			<div>
				<p>B??? l???c :</p>
				<div>
					<form action="${pageContext.request.contextPath}/tu-lanh"
						method="get" class="row">
						<div class="col p-2">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Name</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="nameSearch"
									placeholder="search name" maxlength="30"
									value="${nameSearch1 }">
							</div>

						</div>
						<div class="col p-2">
							<label for="" class="form-label">Price</label>
							<div class="input-group mb-3">

								<input type="text" class="form-control" name="priceFrom"
									placeholder="from" maxlength="10" value="${from }"> <span
									class="input-group-text">-</span> <input type="text"
									class="form-control" name="priceTo" placeholder="to"
									maxlength="10" value="${to }">
							</div>

						</div>
						<core:if test="${sessionScope.role == AccountRole.ADMIN}">
							<div class="col p-2">
								<label for="isDeleted" class="form-label">Status</label> <select
									name="isDeleted" id="isDeleted" class="form-select">
									<option value="all" ${isDel == 'all'?'selected="selected"':'' }>T???t
										c???</option>
									<option value="true"
										${isDel == 'true'?'selected="selected"':'' }>???? x??a</option>
									<option value="false"
										${isDel == 'false'?'selected="selected"':'' }>Ch??a
										x??a</option>
								</select>
							</div>
						</core:if>
						<div class="col d-flex">
							<input type="submit" value="apply"
								class="btn btn-primary align-self-center">
						</div>

					</form>
				</div>
			</div>
			<%-- 
            <div class="row">
            	<a href="${pageContext.request.contextPath }/tu-lanh/insert" class="btn btn-success">Th??m m???i</a>
            </div> --%>
			<div class="row mt-3">
				<core:if test="${sessionScope.userLogin != null }">
					<a href="${pageContext.request.contextPath }/tu-lanh/insert"
						class="btn btn-success">T???o m???i </a>
				</core:if>
			</div>
			<div class="row mt-3">
				<core:if test="${tuLanhList.size() > 0 }">
					<table border="1" class="table">
						<tr>
							<th>ID</th>
							<th>Nh??n hi???u</th>
							<th>M??u</th>
							<th>Tr???ng l?????ng</th>
							<th>Dung t??ch</th>
							<th>S??? c??nh</th>
							<th>S??? l?????ng</th>
							<th>Gi?? b??n</th>
							<th>Tr???ng th??i</th>
							<th>T??n</th>
							<th>M?? t???</th>
							<th>Ng?????i t???o</th>
							<th>Ng?????i c???p nh???t m???i nh???t</th>
							<th>Ng??y t???o</th>
							<th>Ng??y c???p nh???t m???i nh???t</th>
							<th></th>
						</tr>
						<core:forEach items="${tuLanhList }" var="tulanh">
							<tr>
								<td>${tulanh.id }</td>
								<td>${tulanh.brand }</td>
								<td>${tulanh.color }</td>
								<td>${tulanh.weight }Kg</td>
								<td>${tulanh.capacity }L??t</td>
								<td>${tulanh.numOfWing }C??nh</td>
								<td>${tulanh.quantity }</td>
								<td>${tulanh.price }</td>
								<td><core:if test="${tulanh.isDeleted }">Kh??ng b??n</core:if>
									<core:if test="${!tulanh.isDeleted }">C??n b??n</core:if></td>
								<td>${tulanh.name }</td>
								<td>${tulanh.description }</td>
								<td>${tulanh.createUser }</td>
								<td>${tulanh.lastModifieldUser }</td>
								<td>${tulanh.createDate }</td>
								<td>${tulanh.lastModifieldDate }</td>
								<td><core:if test="${sessionScope.userLogin != null }">
										<a
											href="${pageContext.request.contextPath }/tu-lanh/update?id=${tulanh.id}">Update</a>
										<core:if
											test="${sessionScope.role == AccountRole.ADMIN && !tulanh.isDeleted}">
											<a
												onclick="confirmDelete('${pageContext.request.contextPath }',${tulanh.id})"
												href="#">Delete</a>
										</core:if>
									</core:if></td>
							</tr>
						</core:forEach>
					</table>
				</core:if>
				<core:if test="${tuLanhList.size() == 0 }">Kh??ng c?? d??? li???u</core:if>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function confirmDelete(url, id) {
			if (confirm("B???n c?? ch???c mu???n x??a kh??ng")) {
				window.location.href = url + "/tu-lanh/delete?id=" + id;
			} else {

			}
		}
	</script>
</body>

</html>