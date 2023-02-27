<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>멤버 관리</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".list_Btn").on("click", function(){
				location.href = "/board/list";		    
			})
		})
		
		$(function() {
	        $(".delete-form").submit(function(e) {
	            e.preventDefault(); // 폼 기본 동작 중단
	            var form = $(this);
	            var confirmMsg = "정말로 탈퇴시키겠습니까?";
	            if (confirm(confirmMsg)) {
	                $.ajax({
	                    type: form.attr("method"),
	                    url: form.attr("action"),
	                    data: form.serialize(),
	                    success: function(data) {
	                        alert("탈퇴가 완료되었습니다.");
	                        window.location.reload();
	                    },
	                    error: function(xhr, status, error) {
	                        alert("오류가 발생하였습니다.");
	                        console.log(xhr);
	                    }
	                });
	            }
	        });

	        $(".upgrade-form").submit(function(e) {
	            e.preventDefault(); // 폼 기본 동작 중단
	            var form = $(this);
	            var confirmMsg = "정말로 승급시키겠습니까?";
	            if (confirm(confirmMsg)) {
	                $.ajax({
	                    type: form.attr("method"),
	                    url: form.attr("action"),
	                    data: form.serialize(),
	                    success: function(data) {
	                        alert("승급이 완료되었습니다.");
	                        window.location.reload();
	                    },
	                    error: function(xhr, status, error) {
	                        alert("오류가 발생하였습니다.");
	                        console.log(xhr);
	                    }
	                });
	            }
	        });
    	});
	</script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap');

		a, td, th, table, li, a {font-family: 'Noto Sans KR', sans-serif;}
		
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
		
		td, th {
  			border-bottom: 1px solid #ddd;
  			height: 50px;
  			text-align : center;
  		}
  		th {
  			font-size : 19px;
  		}
  		
  		form {
  			display: inline-block;
  		}
		
		.box {
	  		width: 1000px;
		  	height: 600px;
		  	background-color: #FFF;
		  	border-radius: 20px;
		  	position: absolute;
		  	top: 50%;
		  	left: 50%;
		  	transform: translate(-50%, -50%);
		}
		
		#container {
			width: 800px;
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
		
		.user_table{
			width: 800px;
		}
		
		.userId_wrap{
			width: 20%;
		}
	
		.userName_wrap{
			width: 25%;
		}
	
		.role_wrap{
	 		width: 20%;
		}
	
		.regdate_wrap{
			width: 15%;
		}
		
		.option_wrap{
			width: 20%;
		}
		
		.list_Btn{
			width: 330px;
		  	height: 50px;
		  	
		  	color: white;
		  	font-size: 25px;
		  	font-weight: 800;
		  	
		  	background-color: #222;
		  	border-radius: 20px;
		  	
		  	margin-top: 10px;
		}
		
		.upgrade_Btn, .delete_Btn{
			margin-top: 5px;
		  	padding: 3px 3px;
		  	font-size: 15px;
		  	background-color: #F5F5F5;
		  	border-color: #ddd;
		}
	</style>
	<body>
		<div class="box">
			<section id="container">
				<c:choose>
					<c:when test="${member == null and member.role != 'MANAGER'}">
						<p>잘못된 접근입니다.</p>
					</c:when>
					<c:otherwise>
						<div class="view_table">
							<p class="mainText">멤버 관리</p>
							<p class="spaceMaker"></p>
							<table class="user_table">
								<tr>
									<th class ="userId_wrap">아이디</th>
									<th class ="userName_wrap">유저 이름</th>
									<th class ="role_wrap">권한</th>
									<th class ="regdate_wrap">가입일</th>
									<th class ="option_wrap">설정</th>
								</tr>
								<c:forEach items="${list}" var="member">
								    <tr>
								        <td>${member.userId}</td>
								        <td>${member.userName}</td>
								        <td>${member.role}</td>
								        <td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"/></td>
								        <td>
								            <c:if test="${member.role == 'USER'}">
								                <form action="/member/memberDelete" method="post" class="delete-form">
								                    <input type="hidden" name="userId" value="${member.userId}" />
								                    <button type="submit" class="delete_Btn">탈퇴</button>
								                </form>
								                <form action="/member/memberUpgrade" method="post" class="upgrade-form">
								                    <input type="hidden" name="userId" value="${member.userId}" />
								                    <input type="hidden" name="role" value="MANAGER" />
								                    <button type="submit" class="upgrade_Btn">승급</button>
								                </form>
								            </c:if>
								            <c:if test="${member.role == 'MANAGER'}">
								                <p>Manager</p>
								            </c:if>
								        </td>
								    </tr>
								</c:forEach>
								</table>
								<p class="spaceMaker"></p>
								<button class="list_Btn" type="button">목록으로 돌아가기</button>
							</div>
					</c:otherwise>
				</c:choose>
			</section>
		</div>
	</body>
	
</html>