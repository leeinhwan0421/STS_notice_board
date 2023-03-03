<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	.banner {
		list-style:none;
		position: relative;
		width: 100%;
		height: 400px;
		display: block;
		margin: 0px;
		padding: 0px;
	}
	
	.banner_img {
		position: relative;
		vertical-align: middle;
		text-align: center;
	}
	
	.banner_text {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate( -50%, -50% );
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 50px;
		font-weight: 700;
		color: #EEEEEE;
		border-top: 3px solid #EEEEEE;
		border-bottom: 3px solid #EEEEEE;
	}
</style>
<ul class ="banner">
	<li class ="banner_img">
		<img src="/resources/img/banner.png" alt="">
		<li class="banner_text">
			<p>General forum</p>
		</li>
</ul>