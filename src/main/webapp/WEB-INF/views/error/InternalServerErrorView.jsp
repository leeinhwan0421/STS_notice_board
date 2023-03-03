<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<title>Internal Server Error</title>
	</head>
	<style>
		.box {
	  		width: 1100px;
		  	height: 600px;
		  	border-radius: 20px;
		  	position: absolute;
		  	top: 50%;
		  	left: 50%;
		  	transform: translate(-50%, -50%);
		}
		
		.container{
			display: flex;
			align-items: center;
		}
		
		.textGroup{
			margin-top: -300px;
		}
		
		.mainText {
			font-size: 150px;
			font-weight: 800;
			font-family: 'Tilt Warp', cursive;
		}
		
		.description{
			font-size: 80px;
			font-weight: 500;
			font-family: 'Tilt Warp', cursive;
			
			margin-top: -130px;
		}
		
		.icon {
			margin-left: auto;
		}
	</style>
	<body>
		<div id="root">
			<div>
				<%@include file="/resources/Include/nav.jsp" %>
			</div>
		</div>
		
		<div class="box">
			<div class="container">
				<div class ="textGroup">
					<p class="mainText">500</p>
					<p class="description">Internal Server Error</p>
				</div>
				<div class="icon">
					<img src="https://www.fashionn.com/files/board/2015/image/p19r7oa8iuv6qbe545n1abi1kd1.jpg" width="500" height="650">
				</div>
			</div>
		</div>
	</body>
</html>