<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>${read.title}</title>
	</head>
	<style>
		a, td, th, table, li, a{font-family: 'Noto Sans KR', sans-serif;}
		
		label, input, textarea, p, span{
			width: 1000px;
			margin: auto;
			margin-top: 10px;
  			display: block;
  			resize: none;
  			overflow: hidden;
  			outline: none;
  			font-family: 'Noto Sans KR', sans-serif;
		}
		
		textarea{
			min-height: 100;
		}
		
		label, span{
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
		
		.title{
			font-size: 30px;
			font-weight: 800;
			margin-bottom: 10px;
			margin-top: 10px;
			
			border: none;
		}
		
		.border{
			width: 1000px;
			border-bottom: solid 1px #ddd;
			margin-top: 10px;
		}
		
		.view_table {
  			display: flex;
  			flex-direction: column;
  			align-items: center;
  			margin-top: 10px;
		}
		
		.content{
			font-size: 16px;
			margin-top: 10px;
			border: none;
		}
		
		.update_btn, .delete_btn, .list_btn, .replyWriteBtn{
			margin-top: 10px;
		  	padding: 10px 20px;
		  	font-size: 16px;
		  	background-color: #F5F5F5;
		  	border-color: #ddd;
		}
		
		.reply_writer{
		 	border: none;
		 	font-size: 20px;
		}
		
		.replyItem{
			padding-top: 5px;
		}
		
		.replyUpdateBtn, .replyDeleteBtn{
			margin-top: 5px;
		  	padding: 3px 3px;
		  	font-size: 15px;
		  	background-color: #F5F5F5;
		  	border-color: #ddd;
		}
		
	</style>
	<script type="text/javascript">
	
		window.onload = function() {
	      var textarea = document.getElementById("content");
	      textarea.style.height = "auto";
	      textarea.style.height = (textarea.scrollHeight) + "px";
	    };
	
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/board/replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
		})
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/board/fileDown");
			formObj.submit();
		}
	</script>
	
	<body>
		<div class="container">
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<div id="banner">
				<div class="banner-Image">
					<img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3f92e3db-49c0-41f1-8417-b655111a1de6%2F%25EC%2595%2588%25EB%2585%2595%25ED%2595%2598%25EC%2584%25B8%25EC%259A%2594_%25EC%2598%25A4%25EB%258A%2598%25EB%258F%2584_%25EC%25A6%2590%25EA%25B1%25B0%25EC%259A%25B4_%25ED%2595%2598%25EB%25A3%25A8_%25EB%25B3%25B4%25EB%2582%25B4%25EC%2584%25B8%25EC%259A%2594.png?table=block&id=5debbf5f-ca18-4f89-b2de-1cb8b5b0e41c&spaceId=2b7cc640-ccde-444e-b34a-e4adcd1367c6&width=1900&userId=916f94dc-5593-4f96-af20-76df5f60b522&cache=v2" width="1300" height="500">
				</div>
			</div>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>
				
				<div class="view_table">
					<input type="text" id="title" name="title" class="title" value="${read.title}" readonly="readonly" />
					<p>작성자 : ${read.writer}, <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/></p>
					<div class="border"></div>
					<textarea rows="3" id="content" name="content" class="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
					
					<div class="buttongroup">
						<c:if test="${member.userId == read.writer}">
							<button type="button" class="update_btn">수정</button>
							<button type="button" class="delete_btn">삭제</button>
						</c:if>
						<button type="button" class="list_btn">목록</button>	
					</div>
					
					<div class="border"></div>
					
					<span>첨부 파일</span>
					<div class="attachment">
						<c:forEach var="file" items="${file}">
							<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach>
					</div>
					
					<div class="border"></div>
					
					<!-- 댓글 작성 -->
					
					<form name="replyForm" method="post" class="form-horizontal">
						<input type="hidden" id="bno" name="bno" value="${read.bno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<c:if test="${member.userId != null}">
						<input type="hidden" id="writer" name="writer" class="reply_writer" value="${member.userId}" readonly/>
					
						<label for="content">댓글 내용</label>
						<textarea id="content" name="content"></textarea>
					
						<button type="button" class="replyWriteBtn">작성</button>
					</c:if>
					<c:if test="${member.userId == null}">
							<label for="writer">댓글 작성</label>
							<p>로그인 후에 작성하실 수 있습니다.</p>
					</c:if>
					</form>
					
					<!-- 댓글 뷰 -->
					<div id="reply_table">
						<ol class="replyList">
							<c:forEach items="${replyList}" var="replyList">
								<li class="replyItem">
									<p>
									${replyList.writer} 
									</p>
									<p>
									${replyList.content}
									</p>
									<span style="font-size: 12px; color: gray"><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></span>
									<div>
										<c:if test="${member.userId == replyList.writer}">
											<button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
											<button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
										</c:if>
									</div>
								</li>
							</c:forEach>   
						</ol>
					</div>
				</div>
			</section>
			<hr />
		</div>
	</body>
</html>