<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>

<div id="contents" class="contents login page center-f" data-id="login">
	<section class="section s-login">
		<form id="loginForm">
			<h2>
				<img src="/resources/skin/img/login/logo_paint.png" alt="로그인로고">
			</h2>
			<div class="fx jsb">
				<div class="inputBox fx fdc">
					<input type="text" name="m_id" id="m_id" required
						placeholder="아이디를 입력해주세요">
					<input type="password" class="inputTrigger" name="m_pw" id ="m_pw" required placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="btnBox">
					<button id ="loginBtn" type="button">로그인</button>
				</div>
			</div>
		</form>
		<div class="joinTxt pt-A center-f">
			<p><strong>아직도 회원이 아니세요?</strong></p>
			<button type="button" onclick="window.location='/main/signup'">회원가입</button>
		</div>
		<div style="text-align:center;">
			<a href = "https://kauth.kakao.com/oauth/authorize?client_id=c8b8e5a6dfb657aa30f9fbb8b1b6d5fd&redirect_uri=http://localhost:8080/login/oauth2/code/kakao&response_type=code"><img src="/resources/skin/img/login/kakao.png" width="150" ></a>
			</br>
			<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=xGYVtGy2jTxj9ocjlhyj&state=state&redirect_uri=http://localhost:8080/login/oauth2/code/naver"><img src="/resources/skin/img/login/naver.png" width="150" ></a>
		</div>
	</section>
</div>

<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>
