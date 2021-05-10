<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>Page</title>
<!-- <style type="text/css">
.empTable {
	border-collapse: collapse;
	border-spacing: 0;
}

.empTable td {
	font-family: Arial, sans-serif;
	font-size: 16px;
	padding: 10px 5px;
	border- style: solid;
	border-width: 2px;
	overflow: hidden;
	word-break: normal;
	border- color: #ccc;
}

.empTable th {
	font-family: Arial, sans-serif;
	font-size: 16px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 2px;
	overflow: hidden;
	word-break: normal;
	border- color: #ccc;
}

.empTable .empTable-4eph {
	
}
</style> -->
</head>
<body>
<div class="container">
<button class="btn-success" onclick="location.href = 'home';"   >Add</button>
<button class="btn-primary"  onclick="location.href = 'list';"  style="position: right;" >List All</button>
</div>

  
		</br>
		<div style="width: 60%">
		<form:form method='get' action="list" modelAttribute="trans" >
		
			Transaction Type:
			<form:select class="btn btn-default dropdown-toggle" path="transactionType" items="${trx}" />
			&nbsp;&nbsp;&nbsp;&nbsp; Voucher Type:
			<form:select class="btn btn-default dropdown-toggle" path="voucherType" items="${voc}" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<input type="submit" class="btn-danger"	 value="Search"/>
	</form:form>
	<p align="right">
</p>
		</div>


		<c:if test="${not empty list}">
			<table class="table">
				<tr>
					<th width="80">ID</th>
					<th width="120">Transaction Type</th>
					<th width="120">Voucher Type</th>

					<th width="60">Edit</th>
					<th width="60">Delete</th>
					<th><button onclick="location.href = 'list';" class="btn-danger" style="position: right;" >Reset</button>
					</th>
				</tr>

				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.id}</td>

						<td>${item.transactionType}</td>
						<td>${item.voucherType}</td>

						<td><a href="<c:url value='edit?id=${item.id}' />">Edit</a></td>
						<td><a href="<c:url value='delete?id=${item.id}' />">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	
</body>
</html>