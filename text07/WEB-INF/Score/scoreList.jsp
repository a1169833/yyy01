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

.select.select.select.select {
	background: #337ab7;
}

#sco input {
	width: 30px;
	height:23px;
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
						$("tr").click(function() {
							$(this).toggleClass("select");
							selectId = $(this).data("id");
						})

						$("tr")
								.dblclick(
										function() {
											$(this).unbind("dblclick");
											$(this).unbind("click");
											$(this).addClass("updateSco");

											var value = $(this).children().eq(3)
													.text();
											$(this)
													.children()
													.eq(3)
													.html(
															"<input type='text' name='value' value='"+value+"'/>");

										})
						$("#updateBatch3")
								.click(
										function() {
											var scos = "";
											//var array = new Array();
											
											$(".updateSco")
													.each(
															function(index,
																	element) {

																var id = $(this).data("id");
																var value = $(this).find("[name=value]").val();
																
																
																scos += id + "," + value + ";";
																//var sco = {
																//	id : id,
																//	value : value
																//}
																
																//array.push(sco);
															})
											scos = scos.substring(0, scos.length - 1);
										
											//var str = JSON.stringify(array)
											//str = str.replace(/{/g, "%7b");
											//str = str.replace(/}/g, "%7d");

											//window.location.href = "sco?type=updateBatch2&scos=" 
													//+ str;
											window.location.href = "sco?type=updateBatch2&scos=" + scos;
										})
						if (${p.ye}<= 1) {
							$("#pre").addClass("disabled");
							$("#pre").find("a").attr("onclick", "return false");
						} 
						if (${p.ye}>= ${p.maxYe}) {
							$("#next").addClass("disabled");
							$("#next").find("a").attr("onclick", "return false");
						}
					})
					
</script>
</head>
<body>

<div id="main">
<form action="sco" class="form-horizontal" role="form" method="post">
  <div class="form-group">
    <div class="col-sm-2">
      <input type="text" class="form-control" name="name"  placeholder="姓名" value="${c.emp.name}">
    </div>
   <div class="col-sm-3">
      <select name="depName" class="form-control">
      <option  value="">部门</option>
      <c:forEach items="${depList}" var="dep">
      <option  value="${dep.name}"<c:if test="${dep.name==c.emp.dep.name }">selected</c:if>>${dep.name}</option>
      </c:forEach>
      </select>
    </div>
    <div class="col-sm-3">
      <select name="proName" class="form-control">
      <option  value="">项目</option>
      <c:forEach items="${proList}" var="pro">
      <option  value="${pro.name}"<c:if test="${pro.name==c.pro.name }">selected</c:if>>${pro.name}</option>
      </c:forEach>
      </select>
    </div>
   <div class="col-sm-2">
      <input type="text" class="form-control" name="grade"  placeholder="等级" value="${c.grade}">
    </div>
    <div class="form-group">
    <div class=" col-sm-2">
      <button type="submit" class="btn btn-primary">搜索</button>
       </div>
    </div>
  </div>
  

</form>
</div>
	
	<div id="main">
		<table id="sco" class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>姓名</th>				
					<th>部门</th>
					<th>项目</th>
					<th>成绩</th>
					<th>等级</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="sco">

					<tr data-id="${sco.id},${sco.emp.id},${sco.pro.id}">
						<td>${sco.emp.name}</td>
						<td>${sco.emp.dep.name}</td>
						<td>${sco.pro.name}</td>
						<td >${sco.value}</td>
						<td>${sco.grade}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<ul id="PagingBox" class="pagination">
			<li ><a href="sco?ye=1&name=${c.emp.name}&depName=${c.emp.dep.name}&proName=${c.pro.name}&grade=${c.grade}">首页</a></li>
			<li id="pre"><a href="sco?ye=${p.ye-1}&name=${c.emp.name}&depName=${c.emp.dep.name}&proName=${c.pro.name}&grade=${c.grade}">上一页</a></li>
			<c:forEach begin="${p.beginYe}" end="${p.endYe}" varStatus="status">
				<li <c:if test="${p.ye==status.index}"> class="active"</c:if>><a
					href="sco?ye=${status.index}&name=${c.emp.name}&depName=${c.emp.dep.name}&proName=${c.pro.name}&grade=${c.grade}">${status.index}</a></li>
			</c:forEach>
			<li id="next"><a href="sco?ye=${p.ye+1}&name=${c.emp.name}&depName=${c.emp.dep.name}&proName=${c.pro.name}&grade=${c.grade}">下一页</a></li>
		    <li ><a href="sco?ye=${p.maxYe}&name=${c.emp.name}&depName=${c.emp.dep.name}&proName=${c.pro.name}&grade=${c.grade}">尾页</a></li>
		    
		</ul>
        <button id="updateBatch3" type="button" class="btn btn-primary">保存</button>


	
	</div>
</body>
</html>