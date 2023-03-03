<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	.topMenu {
		height: 50px;
		padding: 0px;
		margin-top: -7px;
		margin: 0px;
		background-color:#304852; 
		border-bottom: 1px solid #243C46;
  	}
	
	.btn_Menu { 
		display: flex;
		margin-right: 10px; 
		list-style: none; 
	}
	
	.btn_Menu img {
 	 	margin-right: auto;
		padding: 0px 0px 0px 10px;
	}
	
	.btn_Menu a {
		  font-family: 'Noto Sans KR', sans-serif;
		  font-weight: 550;
		  font-size: 20px;
		  color: #000;
		  padding: 10px;
		  display: inline-block;
		  text-decoration: none;
	}
	
	.btn_Menu a:link, .Btn_Menu a:visited {
		color:#EEEEEE; 
	}
	
	.btn_Menu a:hover {
		color: #666;
	}
	
</style>
<ul class ="topMenu">	
	<li class="btn_Menu">
		<img src="/resources/img/logo.png" alt="" width="100" height="50">
		
		<a href="/board/list">목록</a>
		<a href="/board/writeView">글 작성</a>
		
		<c:if test="${member != null}">
			<a href="/member/logout">로그아웃</a>
			<a href="/member/memberUpdateView">${member.userId}</a>
			<c:if test="${member.role != 'USER'}"><a href="/member/memberManagementView">멤버 관리</a></c:if>
		</c:if>
		<c:if test="${member == null}"><a href="/">로그인</a></c:if>
</ul>