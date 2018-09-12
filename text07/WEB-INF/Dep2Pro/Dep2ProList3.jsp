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
	width: 700px;
	margin: 20px auto;
}

#pro, #noPro {
	width: 600px;
	height: 200px;
	border: 1px solid #337ab7;
	border-radius: 3px;
	background: #ddd;
}

#btn {
	width: 180px;
	margin: 20px auto;
}

#add {
	margin-right: 40px
}

.pro {
	background: #337ab7;
	height: 40px;
	float: left;
	line-height: 40px;
	margin-left: 10px;
	padding: 0 10px;
	margin-top: 10px;
	color: #fff;
	border-radius: 2px;
}

.select {
	background: red;
}
</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	$().ready(function() {
		$(".pro").click(function() {
			$(this).toggleClass("select");
		})
		$("#add").click(function() {
             if($("#noPro").find(".select").length>0){
            	 
            	 var proId=$("#noPro").find(".select").data("id");
            	 $.ajax({
            			url:"d2p", 
						type:"post",
						data:{"type":"add2",depId:${dep.id},proId:proId},
						dataType:"text",
						success:function(data){
							if(data=="true"){
								var pro=$("#noPro").find(".select");
								pro.removeClass("select");
								$("#pro").append(pro);
								
							}	
						}         		 
            	 })  	 
             }else{
            	 alert("请选择数据");
             }			
		})
		
		$("#delete").click(function() {
             if($("#pro").find(".select").length>0){
            	 
            	 var proId=$("#pro").find(".select").data("id");
            	 $.ajax({
            			url:"d2p", 
						type:"post",
						data:{"type":"delete2",depId:${dep.id},proId:proId},
						dataType:"text",
						success:function(data){
							if(data=="true"){
								var pro=$("#pro").find(".select");
								pro.removeClass("select");
								$("#noPro").append(pro);
								
							}	
						}         		 
            	 })  	 
             }else{
            	 alert("请选择数据");
             }			
		})
	})
</script>
</head>
<body>
	<div id="main">

		<h2>${dep.name}</h2>

		<div id="pro">
			<c:forEach items="${list}" var="pro">
				<div class="pro" data-id="${pro.id }">${pro.name }</div>

			</c:forEach>

		</div>
		<div id="btn">
			<button id="add" type="button" class="btn btn-primary">↑</button>
			<button id="delete" type="button" class="btn btn-primary">↓</button>
		</div>
		<div id="noPro">
			<c:forEach items="${nolist}" var="pro">
				<div class="pro" data-id="${pro.id }">${pro.name }</div>

			</c:forEach>

		</div>
</body>
</html>