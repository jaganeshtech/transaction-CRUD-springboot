<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
	var rowCount = 0;
	function addMoreRows(form) {

		var htmltr = '<tr id='+rowCount+'><td><input id="lists'+rowCount+'.branch" name="lists['+rowCount+'].branch" type="text" ></td><td><input id="lists'+rowCount+'.group" name="lists['+rowCount+'].group" type="text"></td><td><input id="lists'+rowCount+'.ledger" name="lists['+rowCount+'].ledger" type="text" ></td>	<td>  <select style="width: 100pt;" name="lists['+rowCount+'].type" > <option value="DR">DR</option>   <option value="CR">CR</option></select> </td>	<td><input type="button" onclick="remove('
		+ rowCount + ');" value="X"></td></tr>';

		$('#ItemTable tr').last().after(htmltr);
		rowCount++;

	}

	function remove(removeNum) {
		$('#' + removeNum).remove();
	}
</script>
</head>
<body>


	<form:form method="post" action="testsave" modelAttribute="lists">
		</br>
<%-- 		<div style="width: 100%">
			TransactionType:
			<form:select path="transactionType" items="${transType}" />
			&nbsp;&nbsp;&nbsp;&nbsp; Voucher Type:
			<form:select path="voucherType" items="${voucherType}" />
		</div>
		</br> --%>
		<table id="ItemTable">
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