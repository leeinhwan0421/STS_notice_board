<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle_btn").on("click", function(){
				location.href = "/";
			})
			
			$(".userID").on('input', function() {
				$("#idChk").attr("value", "N");
	    	})
			
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
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
				if($("#userGrade").val()==""){
					alert("유저 등급을 입력해주세요.");
					$("#userGrade").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			var userID = $('#userId').val();
			if (/\W/.test(userID)) { // 특수 문자가 포함된 경우
			    alert('ID에는 특수 문자나 띄어쓰기를 사용할 수 없습니다.');
			    return false;
			}
			else
			{
				$.ajax({
					url : "/member/idChk",
					type : "post",
					dataType : "json",
					data : {"userId" : $("#userId").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							$("#idChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}
					}
				})
			}
		}
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
			height: 20px;	
		}
		
		.idChk{
			width: 120px;
		  	height: 30px;
		  	
		  	color: white;
		  	font-size: 15px;
		  	font-weight: 800;
		  	
		  	background-color: #222;
		  	border-radius: 20px;
		}
		
		.register_btn, .cancle_Btn{
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
			<form action="/member/register" method="post" id="regForm">
				<div class="view_table">
						<p class="mainText">회원가입</p>
						
						<p class="spaceMaker"></p>
						
						<input type="hidden" id="userGrade" name="userGrade" value="member"/>
						<p> <input class="userID" type="text" id="userId" name="userId" placeholder="ID"/> </p>
						<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
						<p> <input type="password" id="userPass" name="userPass" placeholder="Password" /> </p>
						<p> <input type="text" id="userName" name="userName" placeholder="Your Name" /> </p>
				
						<p class="spaceMaker"></p>	
					
						<button class="register_btn" type="button" id="submit">회원가입</button>
						<button class="cancle_btn" type="button">취소</button>
				</div>
				</form>
			</section>
		</div>
	</body>
	
</html>