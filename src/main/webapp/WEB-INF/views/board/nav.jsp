<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Tilt+Warp&display=swap');
	
	.topMenu {
	margin-top: -7px;
	background-color:#F5F5F5; 
	border-bottom: 1px solid #e5e5e5;
  	}
	
	.RightMenu { list-style: none; margin-left: 100px; display: flex;}
	.RightMenu a{color: #000; padding :10px; display:inline-block;}
	.RightMenu a:hover {color: #666}
	
	a{font-family: 'Noto Sans KR', sans-serif;}
 	a:link {color:black; text-decoration: none;}
 	a:visited {color:black; text-decoration: none;}
 	a:hover {color:black; text-decoration: underline;}
</style>
<ul class ="TopMenu">	
	<li class="RightMenu">
		<a href="https://imported-oyster-bdd.notion.site/MY-INFORMATION-54a4450ff00841b7a123f2e2a0bf0e89">Notion</a>
		<a href="https://www.acmicpc.net/user/lsnan421">Baekjoon</a>
		<a href="https://github.com/leeinhwan0421">Github</a>
		
		<a href="/board/list">목록</a>
		<a href="/board/writeView">글 작성</a>
		
		<c:if test="${member != null}">
			<a href="/member/logout">로그아웃</a>
			<a href="/member/memberUpdateView">${member.userId}</a>
			<c:if test="${member.role == 'MANAGER'}"><a href="/member/memberManagementView">멤버 관리</a></c:if>
		</c:if>
		<c:if test="${member == null}"><a href="/">로그인</a></c:if>
</ul>