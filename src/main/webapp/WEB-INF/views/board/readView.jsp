<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>${read.title}</title>
	</head>
	<style>
		.view_table label, .view_table input, .view_table textarea, .view_table p, .view_table span {
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
		
		.file a:link  { text-decoration: none; }
	
		.file a:hover { text-decoration: underline; }
	
		.file a{
	  	background-color: #FFFFFF;
	  	color: #494949;
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
			
			$.ajax({
				url: "/board/viewCountUp",
			    type: "POST",
			    data: {
			    bno: ${read.bno}
			    },
			    success: function() {
			      console.log("????????? ?????? ??????");
			    }
			})
			
			// ?????? 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// ??????
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("?????????????????????????");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			// ??????
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}"
						      + "&sort=${scri.sort}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				const replyContent = document.getElementsByClassName('replyContent')[0].value.trim();

				if (replyContent === '') {
				    alert('?????? ????????? ??????????????????.');
				    return false;
				}
			
			    var formObj = $("form[name='replyForm']");
			    formObj.attr("action", "/board/replyWrite");
			    formObj.submit();
			});
			
			//?????? ?????? View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&sort=${scri.sort}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
			//?????? ?????? View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&sort=${scri.sort}"
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
		<%@include file="/resources/Include/style.jsp" %>
		<div class="container">
			<div>
				<%@include file="/resources/Include/nav.jsp" %>
				<%@include file="/resources/Include/banner.jsp" %>
			</div>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="sort" name="sort" value="${scri.sort}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>
				
				<div class="view_table">
					<input type="text" id="title" name="title" class="title" value="${read.title}" readonly="readonly" />
					<p>????????? : ${read.writer}, <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/></p>
					<div class="border"></div>
					<textarea rows="3" id="content" name="content" class="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
					
					<div class="buttongroup">
						<c:choose>
							<c:when test="${member.userId == read.writer}">
								<button type="button" class="update_btn">??????</button>
								<button type="button" class="delete_btn">??????</button>
							</c:when>
							<c:when test="${member.role == 'MANAGER' or member.role == 'MASTER'}">
								<button type="button" class="delete_btn">??????</button>
							</c:when>
						</c:choose>
						<button type="button" class="list_btn">??????</button>	
					</div>
					
					<div class="border"></div>
					
					<span>?????? ??????</span>
					<div class="attachment">
						<c:forEach var="file" items="${file}">
							<a class="file" href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach>
					</div>
					
					<div class="border"></div>
					
					<!-- ?????? ?????? -->
					
					<form name="replyForm" method="post" class="form-horizontal">
						<input type="hidden" id="bno" name="bno" value="${read.bno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						<input type="hidden" id="sort" name="sort" value="${scri.keyword}">
				
					<c:if test="${member.userId != null}">
						<input type="hidden" id="writer" name="writer" class="reply_writer" value="${member.userId}" readonly/>
					
						<label for="content">?????? ??????</label>
						<textarea id="content" name="content" class="replyContent"></textarea>
					
						<button type="button" class="replyWriteBtn">??????</button>
					</c:if>
					<c:if test="${member.userId == null}">
							<label for="writer">?????? ??????</label>
							<p>????????? ?????? ???????????? ??? ????????????.</p>
					</c:if>
					</form>
					
					<!-- ?????? ??? -->
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
										<c:choose>
											<c:when test="${member.userId == replyList.writer}">
												<button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">??????</button>
												<button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">??????</button>
											</c:when>
											<c:when test="${member.role == 'MANAGER' or member.role == 'MASTER'}">
												<button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">??????</button>
											</c:when>
										</c:choose>
									</div>
								</li>
							</c:forEach>   
						</ol>
					</div>
				</div>
			</section>
		</div>
		<div>
			<%@include file="/resources/Include/footer.jsp" %>
		</div>
	</body>
</html>