<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						$("#showAdd").click(function() {
							location.href = "pro?type=showAdd"
						})
						$("#showUpdate")
								.click(
										function() {
											if (selectId > -1) {
												location.href = "pro?type=showUpdate&id="
														+ selectId
											} else {
												alert("请选中数据");
											}
										})
						$("#delete").click(
								function() {
									if (selectId > -1) {
										location.href = "pro?type=delete&id="
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
						if (${p.ye}<= 1) {
							$("#pre").addClass("disabled");
							$("#pre").find("a").attr("onclick", "return false");
						} 
						if (${p.ye}>= ${p.maxYe}) {
							$("#next").addClass("disabled");
							$("#next").find("a").attr("onclick", "return false");
						}
					
</script>
</head>
<body>

<div id="main">
<form action="pro" class="form-horizontal" role="form" method="post">
  <div class="form-group">
    <div class="col-sm-3">
      <input type="text" class="form-control" name="name"  placeholder="项目名" value=${c.name}>
    </div>
    <div class=" col-sm-3">
      <button type="submit" class="btn btn-primary">搜索</button>
       </div>
    </div>
  </div>
  

</form>
</div>
	
	<div id="main">
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
		<ul id="PagingBox" class="pagination">
			<li id="pre"><a href="pro?ye=${p.ye-1}&name=${c.name}">上一页</a></li>
			<c:forEach begin="${p.beginYe}" end="${p.endYe}" varStatus="status">
				<li <c:if test="${p.ye==status.index}"> class="active"</c:if>><a
					href="pro?ye=${status.index}&name=${c.name}">${status.index}</a></li>
			</c:forEach>
			<li id="next"><a href="pro?ye=${p.ye+1}&name=${c.name}">下一页</a></li>
		</ul>

		<button id="showAdd" type="button" class="btn btn-primary">增加</button>
		<button id="showUpdate" type="button" class="btn btn-primary">修改</button>
		<button id="delete" type="button" class="btn btn-primary">删除</button>
	</div>
</body>
</html>