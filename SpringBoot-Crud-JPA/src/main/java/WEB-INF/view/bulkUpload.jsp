<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Piramal Bulk Upload</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/images/biometrics.png" type='image/png'>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
</head>
<style>
.txtColor {
	font-size: 40px;
	color: white;
}
</style>

<script>
	var selectFile = false;

	function validateType() {

		var value = document.getElementById("fileType").value;
		if (value == 'R') {
			value = document.getElementById("reqSubType").value;
		} else if (value == 'C') {
			value = document.getElementById("cadSubType").value;
		}

		if (value == 'none') {
			selectFile = false;
			alert("Please select Type to upload")
			return false;
		}
		selectFile = true;
		return true;
	}

	function fileCheck() {
		if (selectFile) {
			return true;
		} else
			alert("Please select a file to upload")
		return false;
	}

	function emailId() {
		alert(document.getElementById('emailId').value);
	}

	function showSub() {

		val = document.getElementById('fileType').value;

		if (val == "R") {
			document.getElementById("sub-req").style.display = 'block';
			document.getElementById("cand-req").style.display = 'none';
		} else if (val == "C") {
			document.getElementById("sub-req").style.display = 'none';
			document.getElementById("cand-req").style.display = 'block';

		} else {
			document.getElementById("sub-req").style.display = 'none';
			document.getElementById("cand-req").style.display = 'none';
		}

	}
</script>

<body>

	<%@ include file="bulk_header.jsp"%>

	<div class="container">
		<div class="row">
			<form method="POST" action="/app/upload"
				enctype="multipart/form-data">
				<div class="col-sm-3">
					<br> <br>

					<div class="form-group">

						<label for="sel1">Select File Type:</label> <select id="fileType"
							name="fileType" class="form-control selectpicker"
							data-width="auto" onchange="showSub();">
							<option value="none">--Select--</option>
							<option value="R">REQUISTION</option>
							<option value="C">CANDIDATE</option>
							<option value="O">OFFERS</option>
						</select>
					</div>

					<div class="form-group" id="sub-req" style="display: none">

						<label for="sel1">Select Req sub Type:</label> <select
							id="reqSubType" name="reqSubType"
							class="form-control selectpicker" data-width="auto">
							<option value="none">--Select--</option>
							<option value="R">A</option>
							<option value="C">B</option>
							<option value="O">C</option>
						</select>
					</div>

					<div class="form-group" id="cand-req" style="display: none">

						<label for="sel1">Select Cand Sub Type:</label> <select
							id="cadSubType" name="cadSubType"
							class="form-control selectpicker" data-width="auto">
							<option value="none">--Select--</option>
							<option value="R">AAA</option>
							<option value="C">AA</option>
							<option value="O">AAA</option>
						</select>
					</div>



					<div class="text-center">
						<label class="btn btn-default btn-file "> Browse..... <input
							type="file" style="display: none;" name="file"
							onclick="return validateType()">
						</label> <label class="btn btn-default btn-file "> Upload <input
							type="submit" style="display: none;"
							onclick=" return fileCheck()">
						</label>

					</div>

				</div>


			</form>


			<div class="col-sm-6">

				<c:if test="${not empty errorList}">
					<div class="panel panel-default ">


						<div class="table-responsive panel-body ">

							<table class="table table-bordered text-center">
								<thead>
									<tr>
										<th class='text-center'>Error Value</th>
										<th class='text-center'>Error Message</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="error" items="${errorList}">

										<tr class="danger">
											<td>${error.errorId }</td>
											<td>${error.errorMsg }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>


				<c:if test="${fileUploaded}">

					<div class="alert alert-success">File uploaded
						sucessfully.................!</div>
				</c:if>



			</div>


			<div class="col-sm-3 text-center">
				<%@ include file="bulkTemplate.jsp"%>
			</div>
		</div>

		<input type="hidden" value='${emailId}' name="emailId">
		<div class="footer navbar-fixed-bottom">&copy; Piramal
			Enterprises Ltd.</div>
	</div>
</body>
</html>
