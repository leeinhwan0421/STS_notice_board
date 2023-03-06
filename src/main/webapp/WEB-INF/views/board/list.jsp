<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	 	<title>한쓰째즈LP까폐</title>
	</head>
	<style>
	a, td, th, table, li, a, button {font-family: 'Noto Sans KR', sans-serif;}
	
	.buttonGroup{
		display: flex;
	  	justify-content: flex-start;
	  	margin-left: 310px;
	  	margin-bottom: -55px;
	  	padding-top: 30px;
	}
	
	.search_table {
	  	display: flex;
	  	justify-content: flex-end;
	  	margin-right: 310px;
	  	padding-top: 30px;
	}
	
	.search_select, .search_input, .search_Btn {		
		margin-left: 5px;
		padding: 2px;
		
		height: 25px;
	
		border: 1px solid #C2C2C2;
		color: #494949;
	}
	
	.search_select {
		width: 100px;
	}
	
	.search_input {
		width: 200px;
	}
	
	.search_Btn {
		width: 60px;
		
		background-color: #5E5E5E;
		color: #FFFFFF;
	}
	
  	table{
 		border-collapse: collapse;
 		width: 1300px;    
 		margin : auto;
 		margin-top : 10px;
 		text-align: center;
  	}
  	
  	.table_header{
		border-top: 2px solid #43434A;
		border-bottom: 1px solid #757C86;
		
		color: #112736;
		font-weight: 800;
		font-size : 19px;
	}
	
	.table_items {
		border-bottom: 1px solid #DDE2E8;
		color: #494949;
	}
	
	.table_Btn {
		text-decoration: none;
		color: #494949;
	}
	
	.table_Btn:hover{        
		text-decoration: underline;
	}
	
	
  	table td, table th{
  		height: 50px;
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
	
	.bno_wrap     { width: 10%; }
	
	.name_wrap    { width: 46%; }
	
	.writer_wrap  { width: 14%; }
	
	.regdate_wrap { width: 14%; }
	
	.view_wrap    { width: 8%; }
	
	.file_wrap    { width: 8%; }
	
	.replyCount, .role_Text{
		color: #E73444;
		font-weight: 700;
	}
	
	.file_Image{
		margin-bottom: -6px;
	}
	
	.spaceMaker{
		height: 30px;
	}
	
	.input-group {
  		display: flex;
  		align-items: center;
	}
	
	.pagination {
  		display: flex;
  		justify-content: center;
  		align-items: center;
  		padding: 10px;
  		font-size: 17px;
  		font-weight: 700;
	}

	.pagination li {
  		padding: 0 10px;

		list-style: none; 
		display:inline-block;
	}

	.pagination a, .pagination a:link  { text-decoration: none; }
	
	.pagination a:hover { text-decoration: underline; }
	
	.otherPage a{
	  	background-color: #FFFFFF;
	  	color: #494949;
	}
	
	.curPage { background-color: #E73444; }
	
	.curPage a{ color: #FFFFFF; }
	
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
		<%@include file="/resources/Include/style.jsp" %>
		<div class="container"> 
			<div>
				<%@include file="/resources/Include/nav.jsp" %>
				<%@include file="/resources/Include/banner.jsp" %>
			</div>
			
			<div class="buttonGroup">
    			<button type="button" class="viewCountSort_Btn">조회순</button>
    			<button type="button" class="bnoSort_Btn">최신순</button>
  			</div>
			
			<div class="search_table">
				<select name="searchType" class="search_select">
					<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select>	 
				<div class="input-group">
					<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="search_input"/>
					<button id="searchBtn" type="button" class="search_Btn">검색</button> 	
				</div>
			</div>
			
			<section id="container" class="table_parent">
				<form role="form" method="get">
					<table class="table_list">
						<thead>
							<tr class="table_header">
								<th class="bno_wrap">번호</th>
								<th class="name_wrap">제목</th>
								<th class="writer_wrap">작성자</th>
								<th class="regdate_wrap">등록일</th>
								<th class="view_wrap">조회수</th>
								<th class="file_wrap">파일</th>
							</tr>
						</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr class = "table_items">
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a class="table_Btn" href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=${scri.sort}">
									<c:out value="${list.title}"/>
									</a>
									<c:if test="${controller.getReplyCount(list.bno) > 0}">
										<span class="replyCount"> [${controller.getReplyCount(list.bno)}] </span>
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
								<td>
									<c:if test = "${controller.getHasFile(list) == true}">
										<img class="file_Image" src="/resources/img/fileImg.png" width="24" height="24">
									</c:if>
								</td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="spaceMaker"></div>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    <li class="${pageMaker.cri.page == idx ? 'curPage' : 'otherPage'}">
							        <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							    </li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
				</form>
			</section>
			
			<div>
				<%@include file="/resources/Include/footer.jsp" %>
			</div>
		</div>
	</body>
</html>