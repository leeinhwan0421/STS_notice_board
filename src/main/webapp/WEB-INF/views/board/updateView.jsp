<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
		window.onload = function() {
	      var textarea = document.getElementById("content");
	      textarea.style.height = "auto";
	      textarea.style.height = (textarea.scrollHeight) + "px";
	    };
	    
		$(function() {
	    	$('textarea').on('input', function() {
	      	this.style.height = 'auto';
	      	this.style.height = this.scrollHeight + 'px';
	    	});
		});
	
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var title = $('#title').val();
			var content = $('#content').val();	
			
			if(content.trim() == "" || title.trim() == "")
			{
				alert("내용이나 제목에 공백만 입력하실 수 없습니다.");
				return true;
			}
			
			var updateForm = $("form[name='updateForm'] .chk").length;
			
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
	</script>
	<style>
		#container label, #container input, #container textarea, #container p{
			width: 1000px;
			margin: auto;
  			display: block;
  			resize: none;
  			overflow: hidden;
  			font-family: 'Noto Sans KR', sans-serif;
		}
		
		textarea{
			min-height: 100;
		}
		
		label{
			font-size: 25px;
			font-weight: 900;
			margin-top: 10px;
			margin-bottom: 10px;
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

		.title_input, .content_textarea {
		  	width: 100%;
		  	max-width: 1000px;
		  	margin-bottom: 10px;
		  	padding: 5px;
		  	font-size: 16px;
		}
		
		.update_btn, .cancel_btn, .fileAdd_btn {
		  	margin-top: 10px;
		  	padding: 10px 20px;
		  	font-size: 16px;
		  	background-color: #F5F5F5;
		  	border-color: #ddd;
		}
	</style>
	<body>
		<%@include file="/resources/Include/style.jsp" %>
		<div id="root"> 
			<div>
				<%@include file="/resources/Include/nav.jsp" %>
				<%@include file="/resources/Include/banner.jsp" %>
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					<input type="hidden" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
					<p class="mainText">글 수정</p>
					<div class="border"></div>
					
					<c:if test="${member.userId != update.writer}">
						<p>글 작성 유저와 정보가 일치 하지 않습니다.</p>
						<p>다음 코멘트는 로그인이 되지 않았거나, 글 작성 유저와 정보가 일치 하지 않는 게정으로 접속하였을 경우</p>
						<p>발생할 수 있습니다.</p>
					</c:if>
					
					<c:if test="${member.userId == update.writer}">
						<table>
							<tbody>
								<tr>
									<td>
										<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="title_input" title="제목을 입력하세요."/>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">내용</label><textarea id="content" name="content" class="content_textarea" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
									</td>
								</tr>
								<tr>
									<td id="fileIndex">
										<c:forEach var="file" items="${file}" varStatus="var">
										<div>
											<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
											<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
											<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
											<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
										</div>
										</c:forEach>
									</td>
								</tr>
							</tbody>			
						</table>
					<div>
						<button type="button" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
						<button type="button" class="fileAdd_btn">파일추가</button>
					</div>
					</c:if>
				</form>
			</section>
		</div>
		<div>
			<%@include file="/resources/Include/footer.jsp" %>
		</div>
	</body>
</html>