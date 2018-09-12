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

#main1 {
	width: 700px;
	margin: 20px auto;
}

#main1 #pro, #noPro {
	width: 400px;
	height: 100px;
	border: 1px solid #337ab7;
	border-radius: 3px;
	background: #ddd;
}

#main1 #btn {
	width: 180px;
	margin: 20px auto;
}

#main1 #add2 {
	margin-right: 40px
}

#main1 .pro{
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

#main1 .select {
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
		$("#add2").click(function() {
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
		
		$("#delete2").click(function() {
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
		
		
             	
             var proLeft=$("#pro").offset().left;
		     var proTop=$("#pro").offset().top;
		     var noProLeft=$("#noPro").offset().left;
		     var noProTop=$("#noPro").offset().top;
		 var proWidth=parseFloat($("#pro").css("width"));
		 var proHeight=parseFloat($("#pro").css("height"));
		 var noProWidth=parseFloat($("#noPro").css("width"));
		 var noProHeight=parseFloat($("#noPro").css("height"));
		 var startLeft;
		 var startTop;
		$( ".pro" ).draggable({
		      start: function() {	
		    	  startLeft=$(this).offset().left;
		    	  startTop=$(this).offset().top;
		      },

		      stop: function() {
		    	  var stopLeft=$(this).offset().left;
		    	  var stopTop=$(this).offset().top;
		    	 
		    	  if(stopLeft>=proLeft&&stopLeft<=proLeft+proWidth&&stopTop>=proTop&&stopTop<=proTop+proHeight){
		    		  var pro =$(this);
		    		  var proId=$(this).data("id");
		    		  
		            	 $.ajax({
		            			url:"d2p", 
								type:"post",
								data:{"type":"add2",depId:${dep.id},proId:proId},  
								dataType:"text",
								success:function(data){
									if(data=="true"){
										pro.css("position","static");
										$("#pro").append(pro);
										pro.css("position","relative");
										pro.css("left","0");
										pro.css("top","0");
										
									}	
								}         		 
		            	 })  	 
		    	  }else{
		    		  $(this).offset({left:startLeft,top:startTop});
		    	  }

		      }
		    });
		
		$( ".pro" ).draggable({
		      start: function() {	
		    	  startLeft=$(this).offset().left;
		    	  startTop=$(this).offset().top;
		      },

		      stop: function() {
		    	  var stopLeft=$(this).offset().left;
		    	  var stopTop=$(this).offset().top;
		    	 
		    	  if(stopLeft>=noProLeft&&stopLeft<=noProLeft+noProWidth&&stopTop>=noProTop&&stopTop<=noProTop+noProHeight){
		    		  var noPro =$(this);
		    		  var proId=$(this).data("id");
		    		  
		            	 $.ajax({
		            			url:"d2p", 
								type:"post",
								data:{"type":"delete2",depId:${dep.id},proId:proId},
								dataType:"text",
								success:function(data){
									if(data=="true"){
										noPro.css("position","static");
										$("#noPro").append(noPro);
										noPro.css("position","relative");
										noPro.css("left","0");
										noPro.css("top","0");
										
									}	
								}         		 
		            	 })  	 
		    	  }else{
		    		  $(this).offset({left:startLeft,top:startTop});
		    	  }

		      }
		    });
		
	})
</script>
</head>
<body>
	<div id="main1">

		<h2>${dep.name}</h2>

		<div id="pro">
			<c:forEach items="${list}" var="pro">
				<div class="pro" data-id="${pro.id }">${pro.name }</div>

			</c:forEach>

		</div>
		<div id="btn">
			<button id="add2" type="button" class="btn btn-primary">↑</button>
			<button id="delete2" type="button" class="btn btn-primary">↓</button>
		</div>
		<div id="noPro">
			<c:forEach items="${nolist}" var="pro">
				<div class="pro" data-id="${pro.id }">${pro.name }</div>

			</c:forEach>

		</div>
</body>
</html>