<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>

            <div id="contents" class="contents mypage page center-f" data-id="mypage">
                <section class="section s-mypage">
                <c:if test="${m_route == 'site'}">
                <form id="mypageForm">
                    <h2 class="tc">회원정보수정</h2>
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="m_id" id="m_id" class="readonly" value="${m_id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>변경비밀번호</th>
                            <td>
                                <input type="password" name="m_pw" id="m_pw" placeholder="비밀번호를 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="email" name="m_email" id="m_email" value="${m_email}" placeholder="변경할 이메일 주소를 입력해주세요 (Namu@naver.com)">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>
                                <input type="number" name="m_num" id="m_phone" value="${m_phone}" placeholder="'-' 없이 입력해주세요 (01012341234)">
                            </td>
                        </tr>
                        <tr>
                            <th>sms수신여부</th>
                            <td>
                                <label for="m_ping" class="agree fx alc">
                                    <input type="checkbox" id="m_ping" name="m_ping" value="1">
                                    <span class="chkbox"></span>
                                </label>
                            </td>
                        </tr>
                        
                    </table>
                    <button id ="myPageModifiyBtn" type="button">수정하기</button>
                </form>
                </c:if>
                <c:if test="${m_route == 'naver'}">
                <form id="mypageFormNaver">
                    <h2 class="tc">회원정보수정</h2>
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="m_id" id="m_id" class="readonly" value="${m_id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>변경비밀번호</th>
                            <td>
                                <input type="password" name="m_pw" id="m_pw" placeholder="비밀번호를 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="email" name="m_email" id="m_email" value="${m_email}" placeholder="변경할 이메일 주소를 입력해주세요 (Namu@naver.com)">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>
                                <input type="number" name="m_num" id="m_phone" value="${m_phone}" placeholder="'-' 없이 입력해주세요 (01012341234)">
                            </td>
                        </tr>
                        <tr>
                            <th>sms수신여부</th>
                            <td>
                                <label for="m_ping" class="agree fx alc">
                                    <input type="checkbox" id="m_ping" name="m_ping" value="1">
                                    <span class="chkbox"></span>
                                </label>
                            </td>
                        </tr>
                        
                    </table>
                    <button id ="myPageModifiyBtn" type="button">수정하기</button>
                </form>                    
                </c:if>
                <c:if test="${m_route == 'naver'}">
                <form id="mypageFormNaver">
                    <h2 class="tc">회원정보수정</h2>
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="m_id" id="m_id" class="readonly" value="${m_id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>변경비밀번호</th>
                            <td>
                                <input type="password" name="m_pw" id="m_pw" placeholder="비밀번호를 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="email" name="m_email" id="m_email" value="${m_email}" placeholder="변경할 이메일 주소를 입력해주세요 (Namu@naver.com)">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>
                                <input type="number" name="m_num" id="m_phone" value="${m_phone}" placeholder="'-' 없이 입력해주세요 (01012341234)">
                            </td>
                        </tr>
                        <tr>
                            <th>sms수신여부</th>
                            <td>
                                <label for="m_ping" class="agree fx alc">
                                    <input type="checkbox" id="m_ping" name="m_ping" value="1">
                                    <span class="chkbox"></span>
                                </label>
                            </td>
                        </tr>
                        
                    </table>
                    <button id ="myPageModifiyBtn" type="button">수정하기</button>
                </form>                          
                </c:if>
            </section>
            </div>
			<script>
				$(document).ready(function(){
					let ping = "<c:out value='${m_ping}'/>";					
					if(ping == "1"){
						$("#m_ping").prop("checked",true);
					}
				});
			</script>

<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>
