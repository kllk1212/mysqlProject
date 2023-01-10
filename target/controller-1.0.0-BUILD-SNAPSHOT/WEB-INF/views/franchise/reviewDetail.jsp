<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>

<script>
	let msg = '${msg}';
	
	console.log(msg);
</script>

<div>
	<table>
		<tr>
			<td>상호명 : ${starInfoOne.s_comName} / 평균별점 : ${starAvg} / 총 참여자수 ${starCount} 명  </td>
		</tr>
		<tr>
			<td>5점 : ${starInfoOne.s_5point} 건</td>
		</tr>
		<tr>
			<td>4점 : ${starInfoOne.s_4point} 건</td>
		</tr>
		<tr>
			<td>3점 : ${starInfoOne.s_3point} 건</td>
		</tr>
		<tr>
			<td>2점 : ${starInfoOne.s_2point} 건</td>
		</tr>
		<tr>
			<td>1점 : ${starInfoOne.s_1point} 건</td>
		</tr>
	</table>
</div>
<div>
	<button type="button" onclick="location.href='/franchise/reviewWrite?comName=${starInfoOne.s_comName}'">리뷰쓰기</button>
</div>






<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>