<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>

    <script>
	$(document).ready(function() {
		//시작하자마자 조건,일반검색으로 검색해서 계산기에 올경우 input 태그에 comName 넣어주기
		let startComName = "${param.comName}";
		console.log("검색 타고 온 경우 회사명 : " + startComName);
		$("#search").val(startComName);

		$("#searchBtn").on("click",function(e){

        // 처음 가이드멘트랑 이미지 숨기기
        $('#guide').hide();
        // 검색값 fadein 효과로 나타나기
        $('#comNameList').fadeIn();

		let search = $("#search").val();
		let comNameListDiv = $("#comNameList");
		console.log(search); // 여기까지 담김

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
						str+= "<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
						//str+= "<tr><td>"+ result[i].s_comName +"<button type='button' id='resultCheckBtn'>선택</button></td></tr>"
					}
					comNameListDiv.html(str); // table에 tr td 넣기

				},
				error: function(e) {
	            	console.log("요청 에러......");
	                console.log(e);
	                str += "<tr><td><a> 검색된 결과가 없습니다</a></td></tr>";
	                comNameListDiv.html(str); // table에 tr td 넣기
				}
			}); //ajax
		}); // $("#searchBtn").
		$("#getBtn").on("click",function(e){
			let size = $("#size").val();
			let areaName = $("#areaName").val();
			let comName= $("input:checkbox[class=resultBtn]:checked").val();

			//let comNameListDiv = $("#comNameList");
			console.log(search); // 여기까지 담김

				$.ajax({
					type: "GET",
					url: "/search/getResultSales",
					data: {"size" : size, "areaName" : areaName,"comName" : comName },
					contentType: "application/json;charset=utf-8",
					success: function(data){
						console.log("요청 성공!!!!!");
						console.log(data);
						//data 가져왔는데 해당지점에 매출정보가 없을경우 alert
						if(data.resultSalesSize == null || data.resultSalesSize==0){
							alert(comName +" (은)는 " + areaName + " 지역에 매출정보가 없습니다.");
						}
						$("#resultSales").val(data.resultSalesSize);
						$("#payRatio").val(Math.floor((data.i_payRatio/100)*data.resultSalesSize));
						$("#workPayMonth").val(Math.floor((data.i_workPayMonth/100)*data.resultSalesSize));
						$("#monthlyRent").val(Math.floor((data.i_monthlyRent/100)*data.resultSalesSize));
						$("#etcPay").val(Math.floor((data.i_etcPay/100)*data.resultSalesSize));
						$("#salesFee").val(Math.floor((data.i_salesFee/100)*data.resultSalesSize));

						$("#realResult").val(data.resultSalesSize - Math.floor((data.i_payRatio/100)*data.resultSalesSize) - Math.floor((data.i_workPayMonth/100)*data.resultSalesSize) - Math.floor((data.i_monthlyRent/100)*data.resultSalesSize) - Math.floor((data.i_etcPay/100)*data.resultSalesSize) - Math.floor((data.i_salesFee/100)*data.resultSalesSize));
						$(".type").text(data.i_type); // 업종명 (치킨,피자,커피,주점) 가져오기
						// 계산기 안에 있는 % 값넣기
 						$("#payRatioI").text(data.i_payRatio+'%');
						$("#workPayMonthI").text(data.i_workPayMonth + '%');
						$("#monthlyRentI").text(data.i_monthlyRent + '%');
						$("#etcPayI").text(data.i_etcPay + '%');
						$("#salesFeeI").text(data.i_salesFee + '%');
					},
					error: function(e) {
		            	console.log("요청 에러......");
		                console.log(e);
					}
				});

		});  // $("#getBtn")

        layer();

		$(".resultInput").keyup(function(){// #resultUl 안에 있느 input 가격 값이 바뀔경우 자동으로 순이익 다시 계산하게 하기
			console.log("되나?");
			let aa = $("#resultSales").val();
			let a = $("#payRatio").val();
			let b = $("#workPayMonth").val();
			let c = $("#monthlyRent").val();
			let d = $("#etcPay").val();
			let e = $("#salesFee").val();
			console.log(aa);
			console.log(a);
			console.log(b);
			console.log(c);
			console.log(d);
			console.log(e);

			$("#realResult").val(aa - a - b - c- d- e);
		});

	}); // $(document).

	function clickCheck(target) { // 체크박스 여러개 체크하지 않게 !!! onclick 이벤트
	    document.querySelectorAll(`input[type=checkbox]`)
	        .forEach(el => el.checked = false);
	    target.checked = true;
		$("#hidden").remove();// 기존의 히든태그가 있다면 삭제 (중복히든태그문제 해결)
		var valueById = $("input:checkbox[class=resultBtn]:checked").val(); // 체크한 상호의 value 값 담김
		//var valueById = $(".resultBtn").val(); // 체크한 상호의 value 값 담김
		console.log(".resultBtn 벨류값 : " +valueById );
		let resultForm = $("#resultForm");
		let str="";
		str="<input type='hidden' id='hidden' name='comName' value='"+valueById  +"'>";
		$("#resultForm").find('table').append(str);
		$("#getResultSalesForm").find('table').append(str);

        // 팝업 확인 창 띄우기
        $('.layer_pop').fadeIn();
        $('.overlay').fadeIn();
        $('.layer_pop .confirm span i').text('"'+valueById+'"');
        $('#checkedComName span').text(valueById); // 체크한 상호명을 가져가서 span 태그에 삽입
		$(".type").text(data.i_type); // 업종명 (치킨,피자,커피,주점) 가져오기

	}

    function layer(){
        // 선택한 것이 true
        $('.layer_pop button').eq(0).on('click',function(){
            $('.layer_pop').hide();
            $('.overlay').hide();
            $('.s-search').hide();
            $('.outerWrap').fadeIn();
        });

        // 선택한 것이 false
        $('.layer_pop button').eq(1).on('click',function(){
            $('.layer_pop').hide();
            $('.overlay').hide();
        });

        // 버튼이 아니라 레이어 바깥을 누를경우
        $('.overlay').on('click',function(){
            $(this).hide();
            $('.layer_pop').hide();
            // 모든 체크박스해제
            $('.agree input[type="checkbox"]').prop('checked',false);
        })
    }

    // if()

	</script>
    <div id="contents" class="contents calc calcMain page page-break" data-id="franchise">

        <h2 class="pt-B tc">월 순이익 계산기</h2>
        <div class="layout_wrap pt-B">

            <section class="section s-search">
                <div class="searchBox center-m">
                    <input placeholder="기업명을 입력해주세요" type="text" name="comName" value="" id="search">
                    <!-- <input placeholder="되도록 정확한 기업명을 입력해주세요" type="text" name="comName" value="${comName }" id="search"> -->
                    <button id="searchBtn" type="submit">검색</button>
                </div>
                <div id="guide" class="guide center-m pt-A">
                    <div class="commentBox">
                        <p>정확한 기업명을 입력해주세요.</p>
                        <p>선택한 기업명의 <i class="fc-red">순이익 예상 데이터</i>를 볼 수 있어요.</p>
                    </div>
                    <div class="imgBox">
                        <img src="../resources/skin/img/calc/graphAni.gif" alt="">
                    </div>
                </div>
                <table id="comNameList" class="center-m mt-A">
    				<!-- 검색한 결과값이 담길 테이블 -->
                    <!-- <tr><td><a> 검색된 결과 수 : "+result.length +"</a></td></tr>
                    <tr>
                        <td>"+ result[i].s_comName +"</td>
                        <td>
    						<label class='agree fx alc' id='"+ result[i].s_comName +"'>
    						<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"'name='"+result[i].s_comName+"'onclick='clickCheck(this)'>
                            <span class='chkbox'></span></label>
                        </td>
                    </tr> -->
    			</table>
            </section>
        </div>
        <!-- //layout_wrap -->

        <section class="outerWrap pt-A">
            <div class="layout_wrap">
                <form id="getResultSalesForm">
                    <div class="form_inwrap">
                        <div class="list_name fdc" id="checkedComName">
                            <h3>선택한 프렌차이즈는 <br><span class="fc-red"></span></h3>
                            <!-- <h3>선택한 프렌차이즈는 <br><span class="fc-red">"+result.length +"</span> 입니다</h3> -->
                            <button type="button" id="getBtn">매출가져오기</button>
                        </div>
                        <i class="line mt-A mb-A"></i>
                        <div>
                            <h4>희망지역을 선택해주세요</h4>
                            <select class="selbox" name="areaName" id="areaName">
                                <option value="서울" selected>서울</option>
                                <option value="부산">부산</option>
                                <option value="대구">대구</option>
                                <option value="인천">인천</option>
                                <option value="광주">광주</option>
                                <option value="대전">대전</option>
                                <option value="울산">울산</option>
                                <option value="세종">세종</option>
                                <option value="경기">경기</option>
                                <option value="강원">강원</option>
                                <option value="충북">충북</option>
                                <option value="충남">충남</option>
                                <option value="전북">전북</option>
                                <option value="전남">전남</option>
                                <option value="경북">경북</option>
                                <option value="경남">경남</option>
                                <option value="제주">제주</option>
                            </select>
                            <div class="commentBox Pb0">
                                <p>국내 시/도 기준으로 선택 가능합니다.</p>
                                <p>실제 창업 조건과 운영 환경에 따라 오차가 발생할 수 있습니다.</p>
                                <p>감가상각, 세금(부가가치세·종합소득세), 점주 인건비를 고려하지 않습니다.</p>
                            </div>
                        </div>
                        <i class="line mt-A mb-A"></i>
                        <div>
                            <h4>희망평수를 선택해주세요</h4>
                            <select class="selbox" name="size" id="size">
                                <option value="1">1평</option>
                                <option value="2">2평</option>
                                <option value="3">3평</option>
                                <option value="4">4평</option>
                                <option value="5">5평</option>

                                <option value="6">6평</option>
                                <option value="7">7평</option>
                                <option value="8">8평</option>
                                <option value="9">9평</option>
                                <option value="10">10평</option>

                                <option value="11">11평</option>
                                <option value="12" selected>12평</option>
                                <option value="13">13평</option>
                                <option value="14">14평</option>
                                <option value="15">15평</option>

                                <option value="16">16평</option>
                                <option value="17">17평</option>
                                <option value="18">18평</option>
                                <option value="19">19평</option>
                                <option value="20">20평</option>

                                <option value="21">21평</option>
                                <option value="22">22평</option>
                                <option value="23">23평</option>
                                <option value="24">24평</option>
                                <option value="25">25평</option>
                            </select>
                            <div class="commentBox Pb0">
                                <p>1평 기준 최대 25평까지 선택할 수 있습니다.</p>
                                <p>실제 창업 조건과 운영 환경에 따라 오차가 발생할 수 있습니다.</p>
                                <p>업종별 평균 예상 매출과 지출 비용은 창업나무가 조사한 내용입니다.</p>
                            </div>
                        </div>
                        <!-- <i class="line mt-A mb-A"></i>
                        <div class="commentBox Pb0">
                            <p>희망지역은 국내 시/도 기준으로 선택 가능합니다.</p>
                            <p>1평 기준 최대 25평까지 선택할 수 있습니다.</p>
                            <p>실제 창업 조건과 운영 환경에 따라 오차가 발생할 수 있습니다.</p>
                            <p>조건에 따라 산출되는 데이터는 창업나무가 조사한 내용입니다.</p>
                        </div> -->
                    </div>
                </form>

            	<form action="/franchise/incomeCalcResult" method="get" id="resultForm">
                    <div class="form_inwrap">
                        <ul id = "resultUl">
                            <li>
                                <div class="list_name">
                                    <h3>예상 총매출</h3>
                                    <!--
                                    <p><a class="type"></a>업종 평균 월 매출액은 <i class="fc-red">1,700만원</i>입니다.</p>
                                      -->
                                </div>
                                <div class="list_val">
                                    <input class="resultInput" type="number" name="resultSales" id="resultSales">
                                </div>
                            </li>
                            <li>
                                <div class="list_name">
                                    <h3>원가</h3>
                                    <p><a class="type fc-red"></a> 업종 평균 원가는 매출의 <i class="fc-red" id="payRatioI"></i>입니다.</p>
                                </div>
                                <div class="list_val">
                                    <input class="resultInput" type="number" name="payRatio" id="payRatio">
                                </div>
                            </li>
                            <li>
                                <div class="list_name">
                                    <h3>직원 급여</h3>
                                    <p><a class="type fc-red"></a> 업종 평균 급여는 매출의 <i class="fc-red" id="workPayMonthI"></i>입니다.</p>
                                </div>
                                <div class="list_val">
                                    <input class="resultInput" type="number" name="workPayMonth" id="workPayMonth">
                                </div>
                            </li>
                            <li>
                                <div class="list_name">
                                    <h3>임대료</h3>
                                    <p><a class="type fc-red" ></a> 업종 평균 임대료는 매출의 <i class="fc-red" id="monthlyRentI"></i>입니다.</p>
                                </div>
                                <div class="list_val">
                                    <input class="resultInput" type="number" name="monthlyRent" id="monthlyRent">
                                </div>
                            </li>
                            <li>
                                <div class="list_name">
                                    <h3>관리비</h3>
                                    <p><a class="type fc-red"></a> 업종 평균 관리비는 매출의 <i class="fc-red" id="etcPayI"></i>입니다.</p>
                                </div>
                                <div class="list_val">
                                    <input class="resultInput" type="number" name="etcPay" id="etcPay">
                                </div>
                            </li>
                            <li>
                                <div class="list_name">
                                    <h3>판매수수료</h3>
                                    <p><a class="type fc-red"></a> 업종 평균 판매 수수료는 매출의 <i class="fc-red" id="salesFeeI"></i>입니다.</p>
                                </div>
                                <div class="list_val">
                                    <input class="resultInput" type="number" name="salesFee" id="salesFee">
                                </div>
                            </li>
                        </ul>
                        <i class="line mb-A mt-A"></i>
                        <div class="res fx">
                            <div class="list_name">
                                <h3 class="Pb0">순이익 (월)</h3>
                            </div>
                            <div class="list_val">
                                <input type="number" id="realResult" value="300" readonly>
                            </div>
                        </div>
                        <div class="btn_area pt-A fx je">
                            <button type="button" onclick="window.print()">인쇄하기</button>
                            <button type="button" onclick="window.location.reload()">다른 브랜드 검색하기</button>
                             <!-- <button type="submit">무슨버튼?</button>
                             <button type="button">초기화</button> -->
                        </div>
                    </div>
            	</form>

            </div>
        </section>
        <!-- //outerWrap -->
    </div>
    <div class="layer_pop layer_pop_calcMain">
        <div class="layer_pop_content">
            <div class="confirm center-f"><span><i class="fc-red"></i>를(을) 선택하셨나요?</span></div>
            <div class="btn_area">
                <button type="button" layer-data="y">예</button>
                <button type="button" layer-data="n">아니오</button>
            </div>
            <!-- <span class="fc-red">"+result.length +"</span> 를 선택하셨나요? -->
        </div>
    </div>
</body>



<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp" %>
