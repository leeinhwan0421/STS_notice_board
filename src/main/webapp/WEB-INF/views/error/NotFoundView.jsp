<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<title>Not Found</title>
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
			
			margin-top: -150px;
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
					<p class="mainText">404</p>
					<p class="description">Not found</p>
				</div>
				<div class="icon">
					<img src="https://mblogthumb-phinf.pstatic.net/MjAxNzAxMjBfMTkx/MDAxNDg0ODUyMjY2NzQ1.MCrR40ubux_eIY61wf_Qtu4STYRF5nHFddcSmeFYE-kg.d6XVSybda17HrfrR-jSCNQgdfKviqI5R-H_znSRSEA4g.PNG.disney-/SADNESS_Fullbody_Render.png?type=w2" width="481" height="624">
				</div>
			</div>
		</div>
	</body>
</html>