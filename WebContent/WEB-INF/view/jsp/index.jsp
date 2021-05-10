<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
	var rowCount = 0;
	function addMoreRows(form) {

		var htmltr = '<tr id='+rowCount+'><td><input id="transactions'+rowCount+'.branch" name="transactions['+rowCount+'].branch" type="text" ></td><td><input id="transactions'+rowCount+'.group" name="transactions['+rowCount+'].group" type="text"></td><td><input id="transactions'+rowCount+'.ledger" name="transactions['+rowCount+'].ledger" type="text" ></td>	<td>  <select style="width: 100pt;" name="transactions['+rowCount+'].type" > <option value="DR">DR</option>   <option value="CR">CR</option></select> </td>	<td><input type="button" onclick="remove('
				+ rowCount + ');" value="X"></td></tr>';

		$('#ItemTable tr').last().after(htmltr);
		rowCount++;

	}

	function remove(removeNum) {
		$('#' + removeNum).remove();
	}
</script>
</head>
<body >

<div class="container">

<button onclick="location.href = 'list';" id="myButton" style="position: right;" >List All</button>



	<form:form method="post" action="save" modelAttribute="trans" class="form-group">
		</br>
		<div style="width: 100%">
			TransactionType:
			<form:select class="btn btn-default dropdown-toggle" path="transactionType" items="${transType}" />
			&nbsp;&nbsp;&nbsp;&nbsp; Voucher Type:
			<form:select class="btn btn-default" path="voucherType" items="${voucherType}" />
		</div>
		</br>
		<table class="table" id="ItemTable">
			<tr>
				<th>Branch</th>
				<th>Group</th>
				<th>ledger</th>
				<th style="width: 100pt;">Type</th>
				<th><input type="button" onclick="addMoreRows(this.form);"
					value="Add"></th>
			</tr>
		</table>
		<input type="submit" value="Save" />
	</form:form>

</body>
</html>