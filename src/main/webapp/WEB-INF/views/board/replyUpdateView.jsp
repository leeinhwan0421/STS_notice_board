<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
		window.onload = function() {
	        const content = document.querySelector('#content');
	        const saveBtn = document.querySelector('#saveBtn');
	        content.addEventListener('input', function() {
	            if (content.value.trim() !== '') {
	                saveBtn.disabled = false;
	            } else {
	                saveBtn.disabled = true;
	            }
	        });
	    };
	
	 	$(function() {
		    $('textarea').on('input', function() {
		      this.style.height = 'auto';
		      this.style.height = this.scrollHeight + 'px';
		    });
		});
	
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyUpdate.bno}"
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
		
		textarea{
			min-height: 200;
			
			width: 100%;
		  	max-width: 1000px;
		  	margin-bottom: 10px;
		  	padding: 5px;
		  	font-size: 16px;
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
  		
  		.update_btn, .cancel_btn{
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
					<img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3f92e3db-49c0-41f1-8417-b655111a1de6%2F%25EC%2595%2588%25EB%2585%2595%25ED%2595%2598%25EC%2584%25B8%25EC%259A%2594_%25EC%2598%25A4%25EB%258A%2598%25EB%258F%2584_%25EC%25A6%2590%25EA%25B1%25B0%25EC%259A%25B4_%25ED%2595%2598%25EB%25A3%25A8_%25EB%25B3%25B4%25EB%2582%25B4%25EC%2584%25B8%25EC%259A%2594.png?table=block&id=5debbf5f-ca18-4f89-b2de-1cb8b5b0e41c&spaceId=2b7cc640-ccde-444e-b34a-e4adcd1367c6&width=1900&userId=916f94dc-5593-4f96-af20-76df5f60b522&cache=v2" width="1300" height="500">
				</div>
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<p class="mainText">댓글 수정</p>
					<div class="border"></div>
					
					<c:if test="${member.userId != replyUpdate.writer}">
						<p>댓글 작성 유저와 정보가 일치 하지 않습니다.</p>
						<p>다음 코멘트는 로그인이 되지 않았거나, 글 작성 유저와 정보가 일치 하지 않는 게정으로 접속하였을 경우</p>
						<p>발생할 수 있습니다.</p>
					</c:if>
					<c:if test="${member.userId == replyUpdate.writer}">
					    <table>
					        <tbody>
					            <tr>
					                <td>
					                    <label for="content">댓글 내용</label>
					                    <textarea id="content" name="content">${replyUpdate.content}</textarea>
					                </td>
					            </tr>   
					        </tbody>            
					    </table>
					    <div>
					        <button type="submit" class="update_btn" id="saveBtn" disabled>저장</button>
					        <button type="button" class="cancel_btn">취소</button>
					    </div>
					</c:if>
				</form>
			</section>
		</div>
	</body>
</html>