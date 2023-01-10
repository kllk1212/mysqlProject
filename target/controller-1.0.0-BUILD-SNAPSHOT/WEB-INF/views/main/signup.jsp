<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script>
	$(function() {
		$("#m_id").on('keyup', idCheck);
	})
	function idCheck() {
		var m_id = $("#m_id").val();
		var sendData = {
			"m_id" : m_id
		}
		console.log(sendData);
		$.ajax({
			method : 'POST',
			url : 'idCheck',
			data : sendData,
			success : function(resp) {
				if (resp == 'fail') {
					$('#idCheck').css('color', 'red')
					$('#idCheck').html("사용할 수 없는 아이디입니다.")
					flag = false;

				} else {
					$('#idCheck').css('color', 'blue')
					$('#idCheck').html("사용할 수 있는 아이디입니다.")
					flag = true;
				}
			}
		})
	}
</script>

<div id="contents" class="contents signup page center-f"
	data-id="signup">
	<section class="section s-signup">
		<form id="signupForm" action="/main/signup" method="post">
			<h2>회원가입</h2>
			<table>
				<tr>
					<th class="fx alc jsb">아이디 <strong><span id="idCheck"></span></strong>
					</th>
					<td><input type="text" name="m_id" id="m_id" required
						placeholder="아이디를 입력해주세요"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_pw" required
						placeholder="비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="m_email" required
						placeholder="이메일 주소를 입력해주세요 (Namu@naver.com)"></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type="number" name="m_num" required
						placeholder="'-' 없이 입력해주세요 (01012341234)"></td>
				</tr>
				<tr>
					<th class="dn">sms수신여부</th>
					<td><label for="m_ping" class="agree fx alc"> <b>*
								유용한 창업정보를 sms로 받겠습니다</b> <input type="checkbox" id="m_ping"
							name="m_ping" value="1"> <span class="chkbox"></span>
					</label></td>
				</tr>
			</table>
			<button type="submit">가입하기</button>
		</form>
	</section>
</div>





<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>