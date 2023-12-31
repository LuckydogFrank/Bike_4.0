<%--
  Created by IntelliJ IDEA.
  Date: 2018/2/8
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; UTF-8" language="java" pageEncoding="UTF-8"  %>
<html>
<head>
	<%@include file="WEB-INF/jsp/common/head.jsp"%>
	<meta charset="UTF-8" >
	<link href="css/login.css" rel="stylesheet">
	<title>登录页面</title>
</head>
<body onload="onLoad();">
<div class = "topDiv">
	<div class="secondDiv"><!-- 覆盖个div，添加透明度 -->
		<br>
		<p align="center" class="slogan" style="margin-bottom: 90px;">校园共享单车管理系统</p>
		<form action="admin/login" method="post" onsubmit="return submitForm();">
			<div class="formDiv">
				<table cellpadding="5" cellspacing="10">
					<tr >
						<td colspan="2" align="center">
							<img width="100" src="images/login/bike.png">
						</td>
					</tr>
					<tr height="50">
						<td >
							账号:
						</td>
						<td>
							<input  class="form-control" placeholder="请输入账号" onblur="checkUsername()" style="width: 190px; height: 35px;" type="text" id = "username" name="aUsername" />
						</td>
					</tr>
					<tr height="50">
						<td>
							密码:
						</td>
						<td>
							<input class="form-control" placeholder="请输入密码" onblur="checkPassword()" type="password" id = "password" name="aPassword" style="width: 190px; height: 35px;">
						</td>
					</tr>
					<tr height="50">
						<td>
							验证码：
						</td>
						<td>
							<input class="col-sm-4 form-control" placeholder="验证码" type="text" onblur="checkRandomCode()" id ="randomCodeByInput"  style="width: 70px; height: 25px;">
							&nbsp;&nbsp;
							<!--用来显示随机数的label-->
							<label id = "codeLabel" style ="height: 25px;width:50px;background-color: rgb(200,200,200);"></label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:void(0);"  onclick="reRandomCode();"><img alt="" src="images/login/refresh.png"></a>
						</td>
					</tr>
					<tr height="50">
						<td >
							<input type="image" value="登陆" class="btn btn-default" src="images/login/login.png" width="70" >
						</td>
						<td>
							<font color = "red">
								<c:if test="${not empty msg }">
									<label id = "msgSpan">${msg}</label>
								</c:if>
								<c:if test="${empty msg}">
									<label id = "msgSpan"></label>
								</c:if>
							</font>
						</td>
					</tr>
				</table>
			</div>
			<!--尾注-->
		</form>
	</div>
</div>
</body>
<!-- do -->
<script src="js/validate.js"></script>
<script type="text/javascript">
    //加载验证码
    function onLoad(){
        var codeLabel =  document.getElementById("codeLabel");//加载窗口的时候加载
        codeLabel.innerHTML= createRandomCode() ;
    }
</script>
</html>
