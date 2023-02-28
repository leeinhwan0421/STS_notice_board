<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<title>Method Not Allowed</title>
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
			margin-top: -100px;
		}
	</style>
	<body>
		<div id="root">
			<div>
				<%@include file="../board/nav.jsp" %>
			</div>
		</div>
		
		<div class="box">
			<div class="container">
				<div class ="textGroup">
					<p class="mainText">405</p>
					<p class="description">Method Not Allowed</p>
				</div>
				<div class="icon">
					<img src="https://www.fashionn.com/files/board/2015/image/p19r7oao371on214921pt3lm6f0g1.jpg" width="575" height="750">
				</div>
			</div>
		</div>
	</body>
</html>