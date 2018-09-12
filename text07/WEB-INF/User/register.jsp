<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
#main{
    width:600px;
    margin: auto;
    margin-top:120px;
    }
    </style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<script type="text/javascript">
$().ready(function(){
	
})



</script>
</head>
<body>
<div id="main">
  <form  id="form" action="user?type=doRegister" method="post"  class="form-horizontal" role="form">

  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">账号</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="username" placeholder="请输入账号" value="${name }"/>
    </div>
  </div>
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" placeholder="请输入密码">
    </div>
  </div>
   <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">确认密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" placeholder="请输入密码">
    </div>
  </div>

 <div class="form-group">
    <div class="col-sm-offset-2 col-sm-3">
      <input type="submit" class="btn btn-primary" value="注册"/>
    </div>
  </div>

  
  </form>
  </div>
</body>
</html>