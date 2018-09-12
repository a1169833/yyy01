<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#main {
	width: 600px;
	margin: 20px auto;
}

#main .select {
	background: #337ab7;
}

#pro td {
	width: 200px
}

#pro input {
	width: 100px
}

#pro select {
	width: 100px;
	height: 30px;
}

#PagingBox {
	width: 600px;
}


</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	$()
			.ready(
					function() {

						var selectId = -1;
						$("#add").click(function() {
						var proId=	$("#selectPro").val();
							location.href = "d2p?type=add&depId=${dep.id}&proId="+proId;
								 	
						})
						
					/*	<c:if test="${f:length(nolist)==0}">
						$("#add").unbind("click");
						$("#add").addClass("disabled");
                         </c:if>
						*/
						if($("#selectPro").children().length==0){
							$("#add").unbind("click");
							$("#add").addClass("disabled");
						}
						
						$("#delete").click(
								function() {
									if (selectId > -1) {
										location.href = "d2p?type=delete&depId=${dep.id}&proId="
												+ selectId
									} else {
										alert("请选中数据");
									}
								}) 

						$("tr").click(function() {
							$(this).toggleClass("select");
							selectId = $(this).data("id");
						})										
										})	
</script>
</head>
<body>

	
	<div id="main">
	
	<h2>${dep.name}</h2>
	
		<table id="pro" class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>id</th>
					<th>项目名</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="pro">

					<tr data-id="${pro.id}">
					    <td>${pro.id}</td>
						<td>${pro.name}</td>
						
					</tr>

				</c:forEach>
			</tbody>
		</table>
        <div class="col-sm-4">
        <select class="form-control" id="selectPro">
        <c:forEach items="${nolist}" var="pro">
           <option value="${pro.id}">${pro.name}</option>
        </c:forEach>
        
        </select>
        </div>
        
        
		<button id="add" type="button" class="btn btn-primary">增加</button>
		<button id="delete" type="button" class="btn btn-primary">删除</button>
	</div>
</body>
</html>