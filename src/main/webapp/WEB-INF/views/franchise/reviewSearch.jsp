<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>


<div>
	<form action="/franchise/reviewSearch" method="get">
		<table>
			<tr>
				<td><a>${paging.comName}(으)로 검색한 결과입니다.</a></td>
			</tr>
			<tr>
				<td>
					찾기 : <input type="text" name="comName" value="${comName }"> <input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</div>



<div>
	
	<table>
		<tr>
			<td>상호명</td>
			<td>별점</td>
		</tr>
		<c:forEach var="comNameList" items="${resultList}" varStatus="status">
			<tr>
				<td>
					${comNameList.s_comName }
				</td>
				<td>
					${comNameList.starAvg }
				</td>
				<td>
					<button type="button" onclick="location.href='/franchise/reviewDetail?comName=${comNameList.s_comName}' ">자세히보기</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>


	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/franchise/reviewSearch?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&comName=${paging.comName}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/franchise/reviewSearch?nowPage=${p }&cntPerPage=${paging.cntPerPage}&comName=${paging.comName}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/franchise/reviewSearch?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&comName=${paging.comName}">&gt;</a>
		</c:if>
	</div>




<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>