<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/libs/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<title>Concept - Bootstrap 4 Admin Dashboard Template</title>
</head>
<div class="dashboard-main-wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="leftslidebar.jsp"></jsp:include>
	<div class="dashboard-wrapper">
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
			<!-- pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">Product Information</h2>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<!-- ============================================================== -->
				<!-- valifation types -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<c:if test="${product.productId == null}">
							<form id="validationform" data-parsley-validate="" novalidate=""
								enctype="multipart/form-data" action="addproduct" method="post">
								<h5 class="card-header">Add Product</h5>
								<div class="card-body">
									<p style="color: red; text-align: center;">${errID}</p>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Product
											ID</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input
												data-parsley-required-message="Please insert Product Code"
												data-parsley-pattern-message="Product Code In Format PXXX - X is digits"
												type="text" required="" data-parsley-pattern="[P]\d{3,}"
												class="form-control" name="productId">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Product
											Name</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" data-parsley-minlength="6"
												class="form-control"
												data-parsley-required-message="Please insert Product Name"
												name="productName">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Category</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<select required="" class="form-control"
												data-parsley-required-message="Please insert Category"
												name="category">
												<c:forEach items="${listCate}" var="cate">
													<option value="${cate.categoryId}">${cate.categoryName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Quantity</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="number" min="0" required=""
												data-parsley-type="number" class="form-control"
												data-parsley-required-message="Please insert Quantity"
												name="quantity">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Price</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" data-parsley-type="number"
												class="form-control"
												data-parsley-required-message="Please insert Price"
												name="price">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Thumbnail</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="file" required="" class="form-control-file"
												data-parsley-required-message="Please choose 1 picture"
												name="thumbnail">
										</div>
									</div>
									<p style="color: red; text-align: center;">${errImages}</p>
									<div class="form-group row">
										<br> <label
											class="col-12 col-sm-3 col-form-label text-sm-right">Other
											Image</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="file" class="form-control-file" required=""
												data-parsley-required-message="Please choose pictures"
												multiple="multiple" name="imagesOther">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Description</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<textarea class="form-control" name="description"></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-sm-right">Visibility</label>
										<div class="col-sm-6">
											<div class="custom-controls-stacked">
												<label class="custom-control custom-checkbox"> <input
													id="ck1" name="visibility" type="checkbox"
													data-parsley-multiple="groups" value="visibility"
													class="custom-control-input"><span
													class="custom-control-label">Visibility</span>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
											<button type="submit" class="btn btn-space btn-primary">Add
												Product</button>
										</div>
									</div>
								</div>
								-
							</form>
						</c:if>
						<c:if test="${product.productId != null }">
							<form id="validationform" data-parsley-validate="" novalidate=""
								enctype="multipart/form-data" action="editproduct" method="POST">
								<h5 class="card-header">Edit Product</h5>
								<div class="card-body">
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Product
											ID</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input
												data-parsley-required-message="Please insert Product Code"
												data-parsley-pattern-message="Product Code In Format PXXX - X is digits"
												type="text" required="" data-parsley-pattern="[P]\d{3,}"
												placeholder="" class="form-control" name="productId"
												readonly value="${product.productId}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Product
											Name</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" data-parsley-minlength="6"
												class="form-control"
												data-parsley-required-message="Please insert Product Name"
												name="productName" value="${product.productName}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Category</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<select required="" class="form-control"
												data-parsley-required-message="Please insert Category"
												name="category">
												<c:forEach items="${listCate}" var="cate">
													<c:if
														test="${product.category.categoryId == cate.categoryId}">
														<option selected value="${cate.categoryId}">${cate.categoryName}</option>
													</c:if>
													<c:if
														test="${product.category.categoryId != cate.categoryId}">
														<option value="${cate.categoryId}">${cate.categoryName}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Quantity</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="number" min="0" required=""
												data-parsley-type="number" class="form-control"
												data-parsley-required-message="Please insert Quantity"
												name="quantity" value="${product.quantity}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Price</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" data-parsley-type="number"
												class="form-control"
												data-parsley-required-message="Please insert Price"
												name="price" value="${product.price}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Thumbnail</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="file" class="form-control-file" name="thumbnail">
										</div>
									</div>
									<div class="form-group row">
										<p style="color: red;">${errImages}</p>
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Other
											Image</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="file" class="form-control-file"
												multiple="multiple" name="imagesOther">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Description</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<textarea class="form-control" name="description">${product.description}</textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-sm-right">Visibility</label>
										<div class="col-sm-6">
											<div class="custom-controls-stacked">
												<label class="custom-control custom-checkbox"> <c:if
														test="${product.visibility == true}">
														<input id="ck1" name="visibility" type="checkbox"
															data-parsley-multiple="groups" value="visibility"
															class="custom-control-input" checked>
													</c:if> <c:if test="${product.visibility == false}">
														<input id="ck1" name="visibility" type="checkbox"
															data-parsley-multiple="groups" value="visibility"
															class="custom-control-input">
													</c:if> <span class="custom-control-label">Visibility</span>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
											<button type="submit" class="btn btn-space btn-primary">Edit
												Product</button>
										</div>
									</div>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end valifation types -->
			<!-- ============================================================== -->
		</div>

	</div>
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<div class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					Copyright © 2018 Concept. All rights reserved. Dashboard by <a
						href="https://colorlib.com/wp/">Colorlib</a>.
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="text-md-right footer-links d-none d-sm-block">
						<a href="javascript: void(0);">About</a> <a
							href="javascript: void(0);">Support</a> <a
							href="javascript: void(0);">Contact Us</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- end footer -->
	<!-- ============================================================== -->
</div>
</div>
<script
	src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/parsley/parsley.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script>
	$('#form').parsley();
</script>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
</body>

</html>