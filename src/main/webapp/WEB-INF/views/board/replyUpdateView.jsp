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
		#container label, #container input, #container textarea, #container p{
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
		<%@include file="/resources/Include/style.jsp" %>
		<div id="root">
			<div>
				<%@include file="/resources/Include/nav.jsp" %>
				<%@include file="/resources/Include/banner.jsp" %>
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<p class="mainText">?????? ??????</p>
					<div class="border"></div>
					
					<c:if test="${member.userId != replyUpdate.writer}">
						<p>?????? ?????? ????????? ????????? ?????? ?????? ????????????.</p>
						<p>?????? ???????????? ???????????? ?????? ????????????, ??? ?????? ????????? ????????? ?????? ?????? ?????? ???????????? ??????????????? ??????</p>
						<p>????????? ??? ????????????.</p>
					</c:if>
					<c:if test="${member.userId == replyUpdate.writer}">
					    <table>
					        <tbody>
					            <tr>
					                <td>
					                    <label for="content">?????? ??????</label>
					                    <textarea id="content" name="content">${replyUpdate.content}</textarea>
					                </td>
					            </tr>   
					        </tbody>            
					    </table>
					    <div>
					        <button type="submit" class="update_btn" id="saveBtn" disabled>??????</button>
					        <button type="button" class="cancel_btn">??????</button>
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