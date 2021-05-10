<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello World!</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
	function addMoreRows(form) {
		var rowCount = $('#ItemTable tr:last').attr("id");
		rowCount++;
		console.log(rowCount);
		var htmltr = '<tr id='+rowCount+'><td></td><td><input id="transactions'+rowCount+'.branch" name="transactions['+rowCount+'].branch" type="text" ></td><td><input id="transactions'+rowCount+'.group" name="transactions['+rowCount+'].group" type="text"></td><td><input id="transactions'+rowCount+'.ledger" name="transactions['+rowCount+'].ledger" type="text" ></td>	<td>  <select style="width: 100pt;" name="transactions['+rowCount+'].type" > <option value="DR">DR</option>   <option value="CR">CR</option></select> </td>	<td><input type="button" onclick="remove('
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

<div class="container">
<button class="btn-success" onclick="location.href = 'home';"   >Add</button>
<button class="btn-primary"  onclick="location.href = 'list';"  style="position: right;" >List All</button>
</div>

	<div style="margin: 50pt 50pt">

		<form:form method="post" action="update" modelAttribute="trans">

			<table id="test">
				<tr>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th>Id:</th>
					<th><form:input path="id" value="${trans.getId()}" type="text"
							style="width:120pt" readonly="true"></form:input></th>

				</tr>

				<tr>
					<th>Transaction Type:</th>
					<th><form:select style="width:120pt" class=".dropdown"
							value="${trans.getTransactionType()}" path="transactionType"
							items="${trx}"></form:select></th>
				</tr>
				<tr>

					<th>Voucher Type:</th>
					<th><form:select value="${trans.getVoucherType()}"
							style="width:120pt" path="voucherType" items="${voc}"></form:select></th>
				</tr>
			</table>


			</br>
			<table id="ItemTable">
				<tr>
					<th>Id</th>
					<th>Branch</th>
					<th>Group</th>
					<th>ledger</th>
					<th>Type</th>
					<th></th>

				</tr>



				<c:forEach items="${trans.transactions}" var="obj"
					varStatus="status">
					<tr id=${status.index}>
						<td><form:input path="transactions[${status.index}].id"
								value="${obj.id}" type="text" disabled="true" /></td>
						<td><form:input path="transactions[${status.index}].branch"
								value="${obj.branch}" type="text" /></td>
						<td><form:input path="transactions[${status.index}].group"
								value="${obj.group}" type="text" /></td>
						<td><form:input path="transactions[${status.index}].ledger"
								value="${obj.ledger}" type="text" /></td>
						<td><form:input path="transactions[${status.index}].type"
								value="${obj.type}" /></td>
						<td>&nbsp; <input type="button"
							onclick="remove('${status.index}');" value="X"></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<td><input type="button" class="btn-info"  onclick="addMoreRows(this.form);"
				value="Add row"></td> &nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn-warning"  type="submit" value="Update" />
		</form:form>
	</div>
</body>
</html>