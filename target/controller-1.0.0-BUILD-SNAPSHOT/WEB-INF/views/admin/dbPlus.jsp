<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
<!-- 
	업종 외식 종류 15개 
	
	한식 A1		갯수 = 3238	pageNum = 324 
	분식 B1		갯수 = 688	pageNum = 69 
	중식 C1		갯수 = 274	pageNum = 28
	일식 D1		갯수 = 442	pageNum = 45
	서양식 E1	갯수 = 297	pageNum = 30 
	기타외국식 F1	갯수 = 297	pageNum = 30 
	패스트푸드 G1	갯수 = 171	pageNum = 18 
	치킨 H1         갯수 = 718	pageNum = 72 ** 선택1 **       
	피자 I1		갯수 = 252	pageNum = 26 ** 선택2 **
	제과제빵 J1	갯수 = 269	pageNum = 27 
	아이스크림 K1	갯수 = 64	pageNum = 7  ******* DB연습넣기 좋음 64개!!
	커피 L1		갯수 = 815	pageNum = 82 ** 선택3 **
	음료 M1		갯수 = 114	pageNum = 12
	주점 N1		갯수 = 451	pageNum = 46 ** 선택4 ** 
	
	기타외식 O1	갯수 = 1487	pageNum = 149 
	(고깃집,횟집 등등)
 -->
    <div  class="layout_wrap admin_section">
	<div>
		<h1 class="pt-B tc">공정거래 위원회 정보공개서 DB로 가져오기</h1>
		<div class="pt-A fx admin_1">
		    <div class="inwrap first">
			    <h2 class="tc">DB에 등록된 프랜차이즈 테마 및 갯수</h2>
				<table class="theme">
					<tr class="title">
						<th><h3>테마</h3></th> <td><h3>갯수</h3></td>
					</tr>
					<c:forEach var="typeList" items="${typeList}">
					<tr>
						<th> ${typeList.type}</th><td> ${typeList.ea}곳</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="inwrap">
				<h2 class="tc">DB 중복 검사</h2>
				<div class="s-search">
					<div class="searchBox center-m">
					   <div class="fx">
					    <input placeholder="기업명을 입력해주세요" type="text" name="comName" value="" id="search">
					    <!-- <input placeholder="되도록 정확한 기업명을 입력해주세요" type="text" name="comName" value="${comName }" id="search"> -->
					    <button id="searchBtn" type="submit">검색</button>
					   </div>
					<table id="comNameList" class="center-m mt-A">
					 <!-- 검색한 결과값이 담길 테이블 -->
					</table>	
					</div>
				</div>
			</div>
		</div>
			
	
   	    <div class="line"></div>
		<div>
			<table class="crolling">
			<tr>
				<td> <h2> 테마 전체 크롤링</h2></td>
			</tr>
			<tr>
				<td> 1. 테마선택 </td>
			</tr>
			<tr>
				<td> 2. db에 추가하고 싶은 외식업 TYPE 셀렉트에서 선택 </td>
			</tr>
	
			<tr>
				<td> 3. DB에저장하기 클릭하면 크롬창이 하나 켜지는데 크롬창이 수십번 켜졌다 꺼졌다를 반복 기다리면 추가 완료 </td>
			</tr>
			<tr>
				<td> 경고! 약 3시간소요 종료가 되었다는 팝업창이 뜰때까지 크롬창을 절대 종료하지마세요. </td>
			</tr>
			<tr>
				<td> 경고! 페이지 이동 및 조작 금지</td>
			</tr>
		</table>
		</div>
	</div>	
	<div>
	<form action="dbPlusPro" method="get">
		<table>
			<tr>	
				<td>
				<select id="menu" name="type" required>
				    <option value="" disabled selected>메뉴</option>
				    <option value="A1">한식</option>
				    <option value="B1">분식</option>
				    <option value="C1">중식</option>
				    <option value="D1">일식</option>
				    <option value="E1">서양식</option>
				    <option value="F1">기타외국식</option>
				    <option value="G1">패스트푸드</option>
				    <option value="H1">치킨</option>
				    <option value="I1">피자</option>
				    <option value="J1">제과제빵</option>
				    <option value="K1">아이스크림</option>
				    <option value="L1">커피</option>
				    <option value="M1">음료(커피외)</option>
				    <option value="N1">주점</option>
				</select>
				<button type="submit">추가하기</button> </td>
			</tr>
		</table>
	</form>
	</div>
	<br/>
	 <div class="line"></div>
	<div>
		<form action="dbPlusOne" method="get">
			<table class="crolling">
				<tr>
					<td> <h2> 특정 브랜드 1곳만 크롤링</h2> </td>
				</tr>
				<tr>
					<td> 1. <a>https://franchise.ftc.go.kr/mnu/00013/program/userRqst/list.do</a> 접속</td>
				</tr>
				<tr>
					<td> 2. 원하는 프랜차이즈 검색 후 프랜차이즈 클릭 </td>
				</tr>
				<tr>
					<td> 3. 해당 사이트 url 복사  : ex) https://franchise.ftc.go.kr/mnu/00013/program/userRqst/view.do?firMstSn=443204</td>
				</tr>
				<tr>
					<td> 4. 검색창에 복사한 url 입력 후 추가하기 클릭</td>
				</tr>
				<tr>
					<td> * 추가하기 클릭전 DB 중복 검사 확인하여 없을 경우 추가!!!!</td>
				</tr>
				<tr>
					<td> <input type="text" name="url">  </td>
					<td><button type="submit">추가하기 </button></td>
				</tr>
	
			</table>
		</form>
	</div>
	</div>



<script>
$(document).ready(function(){
	$("#searchBtn").on("click",function(e){
		let comNameListDiv = $("#comNameList");
		$('#comNameList').fadeIn();
		$.ajax({
			type: "GET",
			url: "/search/searchData",
			data: {"comName" : $("#search").val() },
			contentType: "application/json;charset=utf-8",
			success: function(result){
				console.log("요청 성공!!!!!");
				console.log(result);
				console.log(result.length);
				let str= "";
				str += "<tr><td><span class='commentBox'> 검색된 결과 수 : "+result.length +"</span></td></tr>";
				for(let i = 0; i < result.length; i++){ //result.length 일단 5개까지만
	
					str+= "<tr><td>"+ result[i].s_comName +"</td><td>";
					str+= "<label class='agree fx alc je' id='"+ result[i].s_comName +"'>";
					str+= "</label></td></tr>";
					//str+= "<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
				}
				comNameListDiv.html(str); // table에 tr td 넣기
	
			},
			error: function(e) {
	        	console.log("요청 에러......");
	            console.log(e);
	            str += "<tr><td><a> 검색된 결과가 없습니다</a></td></tr>";
	            comNameListDiv.html(str); // table에 tr td 넣기
			}
		});
	});
});

</script>
	
   	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
