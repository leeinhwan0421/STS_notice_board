<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원정보수정</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle_Btn").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$(".delete_Btn").on("click", function(){
				
				location.href = "/member/memberDeleteView";
						    
			})
				
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
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
			width: 330px;
			height: 50px;
		
			font-size: 20px;
		
			outline: none;
			border-left-width: 0;
			border-right-width: 0;
			border-top-width: 0;
			border-bottom-width: 1;
			
			padding: 5px;
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
			
			border-left-width: 0;
			border-right-width: 0;
			border-top-width: 0;
			border-bottom-width: 0;
		}
		
		.spaceMaker{
			color: #FFFFFF;
			height: 60px;	
		}
		
		.update_Btn, .cancle_Btn{
			width: 330px;
		  	height: 50px;
		  	
		  	color: white;
		  	font-size: 25px;
		  	font-weight: 800;
		  	
		  	background-color: #222;
		  	border-radius: 20px;
		  	
		  	margin-bottom: 10px;
		}
		
		.delete_Btn{ border: none; }
		.delete_Btn:hover {color:black; text-decoration: underline;}
	</style>
	
	<body>
		<div class="box">
			<section id="container">
				<c:if test="${member == null}">
					<p>잘못된 접근입니다.</p>
				</c:if>
				<c:if test="${member != null}">
					<div class ="view_table">
					<form id="updateForm" action="/member/memberUpdate" method="post">
						<input type="hidden" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
						<p class="mainText"> ${member.userId}님의 수정창 </p>
						
						<p class="spaceMaker"></p> 
						<p>	<input type="password" id="userPass" name="userPass" placeholder="new Password" /> </p>
						<p>	<input type="text" id="userName" name="userName" placeholder="new Name"/> </p>				
					</form>
						<p class="spaceMaker"></p>
						<button class="update_Btn" type="button" id="submit">회원정보수정</button>
						<button class="cancle_Btn" type="button">취소</button>
						<p> 계정을 삭제하고 싶으신가요? <button id="registerBtn" type="button" class="delete_Btn">회원탈퇴</button> </p>
					</div>
				</c:if>
			</section>
		</div>
		
	</body>
	
</html>