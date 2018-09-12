<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.*"%>
<%@ page import="util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>批量修改一</title>
<style>
#main {
	width: 1000px;
	margin: 20px auto;
}

.emp {
	width: 400px;
	float: left;
	margin: 10px 50px 10px 0;
	border: 1px dashed #ccc;
	padding: 10px 10px 10px 0;
}

#saveBtn {
	clear: both;
	text-align: center;
}
</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<script>
	$().ready(function() {
		$("#save").click(function() {
			var emps = "";
			$(".emp").each(function(index, element) {

				var id = $(this).find("[name=id]").val();
				var name = $(this).find("[name=name]").val();
				var sex = $(this).find("[name=sex]:checked").val();
				var age = $(this).find("[name=age]").val();
				emps += id + "," + name + "," + sex + "," + age + ";";
			})
			emps = emps.substring(0, emps.length - 1);
			window.location.href = "emp?type=updateBatch2&emps=" + emps;

		})
	})
</script>
</head>
<body>

	<div id="main">
		<c:forEach items="${list}" var="emp">
			<form action="emp" class="form-horizontal emp" method="post">
				<input type="hidden" name="type" value="updateBatch1" /> <input
					type="hidden" name="id" value="${emp.id }" />
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							value="${emp.name}">
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<input type="radio" name="sex"
							<c:if test="${emp.sex=='男'}">
						checked </c:if> value="男">
						男 <input type="radio" name="sex"
							<c:if test="${emp.sex=='女'}"> checked </c:if> value="女">女
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="age"
							value="${emp.age}">
					</div>
				</div>

				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">部门</label>
					<div class="col-sm-10">
						<select name="depId" class="form-control">
							<option value="">部门</option>
							<c:forEach items="${depList}" var="dep">
								<option value="${dep.id}"
									<c:if test="${dep.id==emp.dep.id}">selected</c:if>>${dep.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>


			</form>
		</c:forEach>
		<div id="saveBtn">
			<button id="save" type="button" class="btn btn-primary">保存</button>
		</div>
	</div>
</body>
</html>