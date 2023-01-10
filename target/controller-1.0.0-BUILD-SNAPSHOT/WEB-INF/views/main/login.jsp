<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>

<div id="contents" class="contents login page center-f" data-id="login">
	<section class="section s-login">
		<form id="loginForm" action="/main/login" method="post">
			<h2>
				<img src="/resources/skin/img/login/logo_paint.png" alt="로그인로고">
			</h2>
			<div class="fx jsb">
				<div class="inputBox fx fdc">
					<input type="text" name="m_id" id="m_id" required
						placeholder="아이디를 입력해주세요">
					<input type="password" class="inputTrigger" name="m_pw" required placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="btnBox">
					<button type="submit">로그인</button>
				</div>
			</div>
		</form>
		<div class="joinTxt pt-A center-f">
			<p><strong>아직도 회원이 아니세요?</strong></p>
			<button type="button">
				<a href="/main/signup">회원가입</a>
			</button>
		</div>
	</section>
</div>

<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>
