<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<title>Bad Request</title>
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
		<%@include file="/resources/Include/style.jsp" %>
		<div class="box">
			<div class="container">
				<div class ="textGroup">
					<p class="mainText">400</p>
					<p class="description">Bad Request</p>
				</div>
				<div class="icon">
					<img src="https://pbs.twimg.com/media/ETzX2jWVAAACtr-.jpg" width="500" height="650">
				</div>
			</div>
		</div>
	</body>
</html>