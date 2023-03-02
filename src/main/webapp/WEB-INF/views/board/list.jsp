<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 
	 	<title>한쓰째즈LP까폐</title>
	</head>
	<style>
	a, td, th, table, li, a, button {font-family: 'Noto Sans KR', sans-serif;}
	
  	table{
 		border-collapse: collapse;
 		width: 1300px;    
 		margin : auto;
 		margin-top : 30px;
 		text-align: center;
  	}
  	td, th{
  		border-bottom: 1px solid #ddd;
  		height: 50px;
  	}
  	th{
  		font-size : 19px;
  	}
  	thead{
  		font-weight: 800;
  	}
  	
  	.banner-Image{
  		position: relative;
  		width: 1300px;
  		height: 500px;
  		margin: auto;
  	}
  	
  	.buttonGroupContainer {
  		width: 1300px;
  		margin: 20px auto 0;
  		text-align: right;
		}

	.buttonGroup {
  		display: inline-block;
	}

	.buttonGroup button {
  		background-color: transparent;
  		border: solid 1px #ddd;
		width: 100px;
  		height: 30px;
  		
  		margin-right: 10px;
  		font-size: 15px;
	}
	
	.bno_wrap{
		width: 10%;
	}
	
	.name_wrap{
		width: 45%;
	}
	
	.writer_wrap{
	 	width: 15%;
	}
	
	.regdate_wrap{
		width: 20%;
	}
	
	.view_wrap{
		width: 10%;
	}
	
	.replyCount, .role_Text{
		color: red;
		font-weight: 700;
	}
	
	.file_Image{
		margin-bottom: -6px;
	}
	
	.pagination{
	
	}
	
	.pagination li{
		list-style: none; 
		display:inline-block;
	}
	
	.search_table {
  		display: flex;
  		justify-content: center;
  		align-items: center;
  		padding-top: 30px;
	}
	
	.spaceMaker{
		height: 30px;
	}
	
	.input-group {
  		display: flex;
  		align-items: center;
	}

	.search_table .type_selecter {
  		width: 100px;
  		height: 30px;
	}

	.search_table .search_input {
  		width: 200px;
  		height: 30px;
	}

	.search_table .search_button {
  		width: 100px;
  		height: 30px;
	}
	
	.pagination {
  		display: flex;
  		justify-content: center;
  		align-items: center;
  		padding: 10px;
  		font-size: 17px;
  		font-weight: bold;
	}

	.pagination li {
  		padding: 0 10px;
	}

	.pagination a {
  		text-decoration: none;
  		color: black;
	}
	
	</style>
	<script>
		$(function(){
		    $('#searchBtn').click(function() {
		        self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		    });
		    $('.viewCountSort_Btn').click(function() {
		    	self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&sort=viewCount";
		  	});
		  	$('.bnoSort_Btn').click(function() {
		    	self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&sort=bno";
		  	});
		});
	</script>
	<body>
		<div class="container">

			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<div id="banner">
				<div class="banner-Image">
					<img src="/resources/img/banner.png" width="1300" height="500">
				</div>
				
				<div class="buttonGroupContainer">
  					<div class="buttonGroup">
    					<button type="button" class="viewCountSort_Btn">조회순</button>
    					<button type="button" class="bnoSort_Btn">최신순</button>
  					</div>
				</div>
			</div>
			
			<section id="container" class="table_parent">
				<form role="form" method="get">
					<table class="table_list">
						<thead>
							<tr>
								<th class="bno_wrap">번호</th>
								<th class="name_wrap">제목</th>
								<th class="writer_wrap">작성자</th>
								<th class="regdate_wrap">등록일</th>
								<th class="view_wrap">조회수</th>
							</tr>
						</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr class = "table_items">
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=${scri.sort}">
									<c:out value="${list.title}"/>
									</a>
									<c:if test="${controller.getReplyCount(list.bno) > 0}">
										<span class="replyCount"> [${controller.getReplyCount(list.bno)}] </span>
									</c:if>
									<c:if test = "${controller.getHasFile(list) == true}">
										<img class="file_Image" src="/resources/img/fileImg.png" width="24" height="24">
									</c:if>
								</td>
								<td>
									<c:out value="${list.writer}" />
									<c:if test= "${controller.getWriterRole(list.writer) == 'MANAGER' or controller.getWriterRole(list.writer) == 'MASTER'}">
										<span class="role_Text">[관리자]</span>
									</c:if>
								</td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.hit}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="spaceMaker"></div>
					<div class="search_table">
							<select name="searchType" class="type_selecter">
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						 
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="search_input"/>
								<button id="searchBtn" type="button" class="search_button">검색</button> 	
						</div>
					</div>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
				</form>
			</section>
			
			<div>
				<%@include file="footer.jsp" %>
			</div>
		</div>
	</body>
</html>