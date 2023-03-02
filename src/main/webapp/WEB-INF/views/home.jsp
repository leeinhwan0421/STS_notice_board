<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Login</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login_Btn").on("click", function(){
	    	var id = document.getElementById("userId").value;
	        var pass = document.getElementById("userPass").value;
	        
		    if (id.trim() == '' || pass.trim() == '')
		    {   
		    	alert("아이디 또는 패스워드가 입력되지 않았습니다");
		    	return false;
		    }
		    else
		    {
		    	return true;
		    }
		})
		
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		
		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		
		$("#list_Btn").on("click", function(){
			location.href="board/list";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
	});
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
		height: 70px;	
	}
	
	.login_Btn{
		width: 330px;
	  	height: 50px;
	  	
	  	color: white;
	  	font-size: 25px;
	  	font-weight: 800;
	  	
	  	background-color: #222;
	  	border-radius: 20px;
	}
	
	.register_Btn, .list_Btn{ border: none; }
	.register_Btn:hover, .list_Btn:hover {color:black; text-decoration: underline;}
	
	.member_Update_Btn, .logout_Btn{
	
	}
 	
</style>
<body>
	<form name='homeForm' method="post" action="/member/login">
		<div class="box">
			<div id="container">
				<div class ="view_table">
					<c:if test="${member == null}">
						<p class="mainText"> 로그인 페이지 </p>
					
						<p class ="spaceMaker"></p>
					
						<label for="userId"></label>
						<input type="text" id="userId" name="userId" placeholder="ID">
						
						<label for="userPass"></label>
						<input type="password" id="userPass" name="userPass" placeholder="Password">
						
						<p class ="spaceMaker"></p>
						
						<button id="login_Btn" type="submit" class="login_Btn">로그인</button>
						<p> 아직 계정이 없으신가요? <button id="registerBtn" type="button" class="register_Btn">회원가입</button> </p>
						<p> 계정 없이 목록 보기 <button id="list_Btn" type="button" class="list_Btn">목록 보기</button> </p>
					</c:if>
					<c:if test="${msg == false}">
						<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
					</c:if>
					<c:if test="${member != null}">
						<script>
							location.href="/board/list";
						</script>
					</c:if>
				</div>
			</div>
		</div>
	</form>
</body>
</html>