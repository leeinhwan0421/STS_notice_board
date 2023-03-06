<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle_Btn").on("click", function(){
				
				location.href = "/member/memberUpdateView";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
						}
					}
				})
				
			});
		})
	</script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap');

		a, p, button, input, label{font-family: 'Noto Sans KR', sans-serif;}
		
		a{font-family: 'Noto Sans KR', sans-serif;}
	 	a:link {color:black; text-decoration: none;}
	 	a:visited {color:black; text-decoration: none;}
	 	a:hover {color:black; text-decoration: underline;}
	
		body{
			background: #F5F5F5;
		}
		
		input {
			width: 300px;
			height: 50px;
		
			font-size: 20px;
		
			border-left-width: 0;
			border-right-width: 0;
			border-top-width: 0;
			border-bottom-width: 1;
			
			padding: 5px;
			outline: none;
		}
		
		.box {
	  		width: 500px;
		  	height: 600px;
		  	background-color: #FFF;
		  	border-radius: 20px;
		  	position: absolute;
		  	top: 50%;
		  	left: 50%;
		  	transform: translate(-50%, -50%);
		}
		
		#container {
			width: 440px;
			height: 540px;
	  		display: flex;
	  		justify-content: center;
	  		align-items: center;
	  			
	  		margin: auto;
	  		margin-top: 30px;
		}
		
		.view_table {
	  		display: flex;
	  		flex-direction: column;
	  		align-items: center;
		}
		
		.mainText{
			font-size: 35px;
			font-weight: 800;
			margin-bottom: 10px;
		}
		
		.spaceMaker{
			color: #FFFFFF;
			height: 40px;	
		}
		
		.Delete_Btn, .cancle_Btn{
			width: 330px;
		  	height: 50px;
		  	
		  	color: white;
		  	font-size: 25px;
		  	font-weight: 800;
		  	
		  	background-color: #222;
		  	border-radius: 20px;
		  	
		  	margin-top: 10px;
		}
	</style>
	<body>
		<%@include file="/resources/Include/style.jsp" %>
		<div class="box">
			<section id="container">
				<c:if test="${member == null}">
					<p>잘못된 접근입니다.</p>
				</c:if>
				<c:if test="${member != null}">
					<div class="view_table">
						<form action="/member/memberDelete" method="post" id="delForm">
							<p class="mainText">회원 탈퇴 페이지</p>
							<p class="spaceMaker"></p>
							<p>
								<label class="control-label" for="userId">탈퇴할 계정 ID : </label>
								<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
							</p>
							<p>
								<label class="control-label" for="userPass">패스워드 확인 : </label>
								<input class="form-control" type="password" id="userPass" name="userPass" placeholder="Your Password"/>
							</p>
							<p class="spaceMaker"></p>
						</form>
							<button class="Delete_Btn" type="button" id="submit">회원탈퇴</button>
							<button class="cancle_Btn" type="button">취소</button>
						<div>
						<c:if test="${msg == false}">
							비밀번호가 맞지 않습니다.
						</c:if>
						</div>
					</div>
				</c:if>
			</section>
		</div>
	</body>
	
</html>