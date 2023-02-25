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
		<form id="signupForm">
			<h2>회원가입</h2>
			
			<table>
				<tr>
					<th class="fx alc jsb">아이디 <button type="button" id="idChk">중복체크</button></th>
					<td><input type="text" name="m_id" id="m_id" required
						placeholder="아이디를 입력해주세요"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_pw" id="m_pw" required
						placeholder="비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<th class="fx alc jsb">닉네임 <button type="button" id="nickChk">중복체크</button></th>
					<td><input type="text" name="m_nickName" id="m_nickName" required
						placeholder="닉네임을 입력해주세요"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="m_email" id="m_email" required
						placeholder="이메일 주소를 입력해주세요 (Namu@naver.com)"></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type="number" name="m_phone" id="m_phone" required
						placeholder="'-' 없이 입력해주세요 (01012341234)"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="m_gender">
						    <option value="" disabled>성별 선택</option>
						    <option value="male">남</option>
						    <option value="female">여</option>
						</select>
					</td>
	
				</tr>
				<tr>
					<th class="dn">sms수신여부</th>
					<td><label for="m_ping" class="agree fx alc"> <b>*
								유용한 창업정보를 sms로 받겠습니다</b> <input type="checkbox" id="m_ping"
							name="m_ping" value="1"> <span class="chkbox"></span>
					</label></td>
				</tr>
			</table>
			<button id ="signupBtn" type="button">가입하기</button>
			<button id ="resetBtn" type="button">새로고침</button>
			<div align="center"><input type="button" value="네이버로 회원가입" onclick="window.location='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=xGYVtGy2jTxj9ocjlhyj&state=state&redirect_uri=http://localhost:8080/login/oauth2/code/naver'" /></div>
	        <div align="center"><input type="button" value="카카오로 회원가입" onclick="window.location='https://kauth.kakao.com/oauth/authorize?client_id=c8b8e5a6dfb657aa30f9fbb8b1b6d5fd&redirect_uri=http://localhost:8080/login/oauth2/code/kakao&response_type=code'" /></div>
			
		</form>
	</section>
</div>



<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>