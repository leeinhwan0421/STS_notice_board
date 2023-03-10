<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
	  $(function() {
		    $('textarea').on('input', function() {
		      this.style.height = 'auto';
		      this.style.height = this.scrollHeight + 'px';
		    });
		});
	  
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				var title = $.trim($('#title').val());
				var content = $.trim($('#content').val());

				$('#title').val(title);
				$('#content').val(content);
				
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		
		function fn_valiChk()
		{
			var title = $('#title').val();
			var content = $('#content').val();	
			
			if(content.trim() == "" || title.trim() == "")
			{
				alert("내용이나 제목에 공백만 입력하실 수 없습니다.");
				return true;
			}
		}
		
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
	</script>
	<style>
		.view_table label, .view_table input, .view_table textarea, .view_table p{
			width: 1000px;
			margin: auto;
  			display: block;
  			resize: none;
  			overflow: hidden;
  			font-family: 'Noto Sans KR', sans-serif;
		}
		
		textarea{
			min-height: 300;
		}
		
		label{
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

		.view_table {
  			display: flex;
  			flex-direction: column;
  			align-items: center;
		}

		.title_input, .content_textarea, .writer_input {
		  	width: 100%;
		  	max-width: 1000px;
		  	margin-bottom: 10px;
		  	padding: 5px;
		  	font-size: 16px;
		}
		
		.writer_input {
			border: none;
			outline: none;
		}
		
		.write_btn, .fileAdd_btn {
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
				<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
					<p class="mainText">글 작성</p>
					<div class="border"></div>
					<table class="view_table">
						<tbody>
							<c:if test="${member.userId != null}">
								<tr>
									<td>
										<input type="text" id="title" name="title" class="title_input" placeholder="제목을 입력하세요."/>
									</td>
								</tr>	
								<tr>
									<td>
										<textarea id="content" name="content" class="content_textarea" placeholder="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">작성자</label>
										<input type="text" id="writer" name="writer" class="writer_input" title="작성자를 입력하세요." value="${member.userId}" readonly/>
									</td>
								</tr>
								<tr>
								<tr>
									<td id="fileIndex">
									</td>
								</tr>
								<tr>
									<td>						
										<button class="write_btn" type="submit">작성</button>	
										<button class="fileAdd_btn" type="button">파일추가</button>	
									</td>
								</tr>	
							</c:if>
							<c:if test="${member.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>
							
						</tbody>			
					</table>
				</form>
			</section>
		</div>
		<div>
			<%@include file="/resources/Include/footer.jsp" %>
		</div>
	</body>
</html>