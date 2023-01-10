<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>
<div>
	<table>
		<tr>
			<td>상호명 : ${starInfoOne.s_comName} / 평균별점 : ${starAvg} / 총 참여자수
				${starCount} 명</td>
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
	<form class="mb-3" action="/franchise/reviewWritePro" name="myform" id="myform" method="post">
		<input type="hidden" name="s_comTitle"  value="${starInfoOne.s_comTitle}">
		<input type="hidden" name="s_comName" value="${starInfoOne.s_comName}">

		<input type="hidden" name="s_id" value='${user_id }'>
		<fieldset>
			<span class="text-bold">별점을 선택해주세요</span> 
			<input type="radio" name="s_savePoint" value="5" id="rate1"><label for="rate1">★</label>
			<input type="radio" name="s_savePoint" value="4" id="rate2"><label for="rate2">★</label>
			<input type="radio" name="s_savePoint" value="3" id="rate3"><label for="rate3">★</label> 
			<input type="radio" name="s_savePoint" value="2" id="rate4"><label for="rate4">★</label> 
			<input type="radio" name="s_savePoint" value="1" id="rate5"><label for="rate5">★</label>
		</fieldset>
		<textarea class="col-auto form-control" type="text" name="s_comment" id="reviewContents" placeholder="욕설및 뭐시기는 사이버뭐시기법으로 뭐시기되오니~~"></textarea>
		<input type="submit" value="작성하기"> 
	</form>
</div>


<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>




<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>