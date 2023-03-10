<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>
<script defer src="/resources/skin/js/signup.js"></script>
<div id="contents" class="contents signup page center-f"
	data-id="signup">
	<section class="section s-signup">
		<form id="naverSignupForm">
			<input type="hidden" name="m_id" id="m_id" value="${vo.m_id}">
			<h2>네이버로 회원가입</h2>
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${name }"  readonly="readonly"></td>
				</tr>
				<tr>
					<th class="fx alc jsb">닉네임 <button type="button" id="nickChk">중복체크</button></th>
					<td><input type="text" name="m_nickName" id="m_nickName" required
						placeholder="닉네임을 입력해주세요"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="m_email" id="m_email" value="${vo.m_email }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type="number" name="m_phone" id="m_phone" required
						placeholder="'-' 없이 입력해주세요 (01012341234)"></td>
				</tr>
				<tr>
					<th>성별</th>
					
					<c:if test="${vo.m_gender == 'male' }">
					<td>
						<select name="m_gender" id="m_gender" >
							<option value="" disabled>성별 선택</option>
						    <option value="male">남</option>
						</select>
					</td>					
					</c:if>
					<c:if test="${vo.m_gender == 'female' }">
					<td>
						<select name="m_gender" id="m_gender">
						    <option value="" disabled>성별 선택</option>
						    <option value="female">여</option>
						</select>
					</td>
					</c:if>
	
				</tr>
				<tr>
					<th class="dn">sms수신여부</th>
					<td><label for="m_ping" class="agree fx alc"> <b>*
								유용한 창업정보를 sms로 받겠습니다</b> <input type="checkbox" id="m_ping"
							name="m_ping" value="1"> <span class="chkbox"></span>
					</label></td>
				</tr>
			</table>
			<button id ="naverSignupBtn" type="button">가입하기</button>
		</form>
	</section>
</div>




<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>