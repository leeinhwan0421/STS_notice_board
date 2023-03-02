<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<style>
		label, input, textarea, p{
			width: 1000px;
			margin: auto;
  			display: block;
  			resize: none;
  			overflow: hidden;
  			font-family: 'Noto Sans KR', sans-serif;
		}
		
		label{
			font-size: 25px;
			font-weight: 900;
		}
	
		.banner-Image{
  			width: 1300px;
  			height: 500px;
  			margin: auto;
  		}
  		
  		#container {
			width: 1300px;
  			display: flex;
  			justify-content: center;
  			align-items: center;
  			
  			margin: auto;
  			margin-top: 30px;
  			border: solid 1px #ddd;
  			
  			min-height: 500px;
		}
		
		.mainText{
			font-size: 30px;
			font-weight: 800;
			margin-bottom: 10px;
			margin-top: 10px;
			margin-left: 10px;
		}
		
		.border{
			width: 1000px;
			border-bottom: solid 1px #ddd;
			margin-bottom: 10px;
		}
  		
  		.delete_btn, .cancel_btn{
		  	margin-top: 10px;
		  	padding: 10px 20px;
		  	font-size: 16px;
		  	background-color: #F5F5F5;
		  	border-color: #ddd;
		}
	</style>
	<body>
	
		<div id="root">
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<div id="banner">
				<div class="banner-Image">
					<img src="/resources/img/banner.png" width="1300" height="500">
				</div>
			</div>
				<section id="container">
					<form name="updateForm" role="form" method="post" action="/board/replyDelete">
						<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
						<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
						<p class="mainText">댓글 삭제</p>
						<div class="border"></div>
						
						<div>
							<c:choose>
								<c:when test="${member.userId == replyDelete.writer}">
									<p>댓글을 삭제 하시겠습니까?</p>
									<button type="submit" class="delete_btn">예 삭제합니다.</button>
									<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
								</c:when>
								<c:when test="${member.role == 'MANAGER' or member.role == 'MASTER'}">
									<p>댓글을 삭제 하시겠습니까?</p>
									<button type="submit" class="delete_btn">예 삭제합니다.</button>
									<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
								</c:when>
								<c:otherwise>
									<p>댓글 작성 유저와 정보가 일치 하지 않습니다.</p>
									<p>다음 코멘트는 로그인이 되지 않았거나, 매니저 권한이 없는 유저거나, 글 작성 유저와 정보가 일치 하지 않는 게정으로 접속하였을 경우</p>
									<p>발생할 수 있습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</section>
			</div>
		<div>
			<%@include file="footer.jsp" %>
		</div>
	</body>
</html>