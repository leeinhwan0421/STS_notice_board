<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
.bottomMenu {
		list-style:none;
		
		width: 100%;
		
		margin: 0px;
		padding: 0px;
		
		margin-top: 60px;
	}

	.gray_wrap {
		display: flex;
		justify-content: center;
		
		height: 60px;
		
		background-color:#6B6B72; 
		border-top: 1px solid #5F5F66;
		border-bottom: 1px solid #5F5F66;
	}
	
	.gray_wrap a {
		  font-family: 'Noto Sans KR', sans-serif;
		  font-weight: 550;
		  font-size: 20px;
		  
		  padding: 10px;
		  
		  display: inline-block;
		  text-decoration: none;
	}
	
	.gray_wrap a:link, .gray_wrap a:visited {
		color:#DDDDDD; 
	}
	
	.gray_wrap a:hover {
		color: #C7C7C7;
	}
	
	.white_wrap {
		display: flex;
		justify-content: center;
		
		height: 140px;
	}
	
	.white_wrap .vertical_border {
		height: 120px;
		border-left: 3px solid #E5E5E5;
	}
	
	.white_wrap .information{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
		height: 120px;
		padding-left: 20px;
		padding-top: 10px;
		
		color: #666666;
	}
	
	.white_wrap .information .info_title {
		font-weight: 700;
	}
	
</style>
<ul class="bottomMenu">
	<li class="footer">
		<div class="gray_wrap">
		 	<a href="https://github.com/leeinhwan0421/STS_notice_board">Source Code</a>
		 	<a href="https://imported-oyster-bdd.notion.site/MY-INFORMATION-54a4450ff00841b7a123f2e2a0bf0e89">Notion</a>
		 	<a href="https://www.acmicpc.net/user/lsnan421">Baekjoon</a>
		</div>
		<div class="white_wrap">
			<img src="/resources/img/logo.png" alt="">
			<p class="vertical_border"></p>
			<div class="information">
			 	<p class="info_title">Maker | Hans</p>
			 	<p class="info_content">Copyright 2023. Hans. All rights reserved.</p>
			</div>
		</div>
	</li>
</ul>