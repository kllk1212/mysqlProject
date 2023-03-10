<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
            <div id="contents" class="contents diagnosis diagnosisMain page page-break" data-id="diagnosis">

                <!-- 검색 결과 페이지 -->
                <div class="layout_wrap pt-B">
                    <h2 class="pt-B tc">프랜차이즈 검색결과</h2>
                    <!-- <span class="line"></span> -->
                    <!-- <div>선택한 프렌차이즈는 ${comName} 입니다</div> -->
                    <!-- 브랜드 정보 / 가맹현황 / 기업 정보 : 노출 선택 탭 -->
                    <div class="tab">
                        <!-- ## tab header ##-->
                        <div class="tab_header tc center-m">
                            <!-- <span class="line"></span> -->
                            <div class="inwrap">
                                <div class="tl">
                                    선택한 프렌차이즈는 <br>
                                    <p><i class="fc-red">${ areaName}</i>지역 <i class="fc-red">${comName}</i>&nbsp;입니다</p>
                                </div>
                                <div>
                                    <ul class="tab_btn center-f">
                                        <li class="on">매출 비교 그래프</li>
                                        <li>가맹 현황</li>
                                        <li>브랜드 정보</li>
                                        <!-- <li>기업 정보</li> -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <span class="line mt-A mb-A"></span>
                        <!-- ## tab content ##-->
                        <!-- <div> -->
                        <div class="tab_cont pt-A pb-A">

                            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                            <!-- chart tab (매출 비교 값 그래프) -->
                            <div class="tab_chart center-m">
                                <div class="fx jsb">
                                    <div class="tab_inwrap">
                                        <table>
                                            <tr>
                                           	 <c:set var="avg" value="${cDTO.c_tAvgSales/100}" />
                                                <th>${comName} 매장들의 평균 매출액</th>
                                                <td class="numTrans"><fmt:formatNumber type="number"  pattern="0" value="${ ((avg*100) - ((avg*100)%1)) * (1/100)   } " /></td>
                                            </tr>
                                            <tr>
                                                <th>${ areaName} 지역의 ${cDTO.c_type } 업종 프랜차이즈 평균 매출</th>
                                                <td class="numTrans">${avgSales}</td>
                                            </tr>
                                            <tr>
                                                <th>전국 ${cDTO.c_type } 업종 프랜차이즈 평균 매출</th>
                                                <td class="numTrans">${avgSalesAll}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="tab_inwrap">
                                        <p class="unit">(단위: 만원)</p>
                                        <div class="tab_chart_inwrap fx fdc">
                                            <div id="chart" class="chart"></div>
                                            <ul class="category_num">
                                                <li>
                                                    <!-- <span>${cDTO.c_tAvgSales/100}만원</span> -->
                                                    <!-- <c:set var="avg" value="${cDTO.c_tAvgSales/100}" /> -->
                                                    <!--노출되지않음 소수점버림  -->
                                                    <!-- <span style="font-size: 10pt">${comName }</span></br>
                                                    <span><fmt:formatNumber type="number"  pattern="0" value="${ ((avg*100) - ((avg*100)%1)) * (1/100)   } " /></span> -->
                                                    <p>${comName }</p>
                                                    <span class="numTrans"><fmt:formatNumber type="number"  pattern="0" value="${ ((avg*100) - ((avg*100)%1)) * (1/100)   } " /></span>
                                                </li>
                                                <li>
                                                    <!-- <span>${avgSales}만원</span> -->
                                                    <!-- <span style="font-size: 15pt">${areaName }평균</span></br>
                                                    <span>${avgSales}</span> -->
                                                    <p>지역평균</p>
                                                    <span class="numTrans">${avgSales}</span>
                                                </li>
                                                <li>
                                                    <!-- <span>${avgSalesAll}만원</span> -->
                                                    <!-- <span style="font-size: 15pt">전국평균</span></br>
                                                    <span>${avgSalesAll}</span> -->
                                                    <p>전국평균</p>
                                                    <span class="numTrans">${avgSalesAll}</span>
                                                </li>
                                            </ul>
                                            <span class="line"></span>
                                        </div>
                                        <div class="category_list">
                                            <div>
                                                <p>${comName} 매장들의 평균 매출액</p>
                                            </div>
                                            <div>
                                                <p>${ areaName} 지역의 ${cDTO.c_type } 업종 프랜차이즈 평균 매출
                                                <p>
                                            </div>
                                            <div>
                                                <p>전국 ${cDTO.c_type } 업종 프랜차이즈 평균 매출</p>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                            <!-- franchise info tab (가맹 현황) -->
                            <div class="tab_fc">
                                <div class="fx jsb">
                                    <div class="tab_inwrap">
                                        <table>
                                            <tr>
                                                <th>가맹 총부담금</th>
                                                <td class="numTrans">${cDTO.c_totalFee/10}원 </td>
                                            </tr>
                                            <tr>
                                                <th>평균 매출액</th>
                                                <td class="numTrans">${cDTO.c_tAvgSales/100}원</td>
                                            </tr>
                                            <tr>
                                                <th>1평당 평균매출액</th>
                                                <td class="numTrans">${cDTO.c_tSquareSales/100}원</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="tab_inwrap commentBox">

                                        <!-- ${areaName}지역의 ${cDTO.c_type } 업종 프랜차이즈 매장수 는  ${allFchaEA }개 입니다
                                         ${ areaName}지역의 ${comName}점포수는 ${fDTO[0].f_franchiseeEa} 개 입니다. (${fDTO[0].f_year} 기준)  -->

                                        <!-- ${ areaName}지역의 ${comName}점포수는 ${fDTO[0].f_franchiseeEa} 개 입니다.  -->
                                        <!-- ${ areaName}지역에는 전국 ${fDTO[0].f_franchiseeEa / cDTO.c_storeCount }%의 ${comName}이 (가)있습니다.  -->
                                        <!-- 이 데이터는 (${fDTO[0].f_year} 년 기준입니다.  -->

                                        <!-- 3번째줄 -->
                                        <!-- 산텍지역 선택 브랜드 매장수 / 선택지역 해당업종 브랜드 매장수 -->
                                        <!-- 168/1830 -->
                                        <!-- <span class="center">${fDTO[0].f_franchiseeEa} /${allFchaEA }</span> -->

                                        <!-- 4번째줄 -->
                                        <!-- 브랜드정보에있는 네네치킨 점포수 최근 기준 개수 /총 점포수 -->
                                        <!-- 168/1096 -->
                                        <!-- <span class="center">${fDTO[0].f_franchiseeEa / cDTO.c_storeCount }</span> -->

                                        <div class="inwrap">
                                            <!-- 노출되지않음 소수점 변환위해-->
                                            <!-- ${cDTO.c_storeCount }전국네네치킨매장수 // fDTO[0].f_franchiseeEa 지역의 네네치킨 매장수
                                                    allFchaEA // 동종업계 해당지역의 총 매장수
                                               -->
                                            <c:set var="num" value="${fDTO[0].f_franchiseeEa/cDTO.c_storeCount*100 }" />
                                            <!--서울네네치킨 / 전국네네치킨 % -->
                                            <c:set var="num2" value="${fDTO[0].f_franchiseeEa / allFchaEA*100}" /><!-- 지역네네치킨 / 지역치킨업종 -->


                                            <p>
                                                <span>
                                                    ${areaName} 지역의 ${cDTO.c_type } 업종 프랜차이즈 매장수 는 <i class="fc-red fwb">${allFchaEA }개</i> 입니다.
                                                </span>
                                            </p>
                                            <p>
                                                <span>
                                                    전국의 ${comName} 매장수 는 <i class="fc-red fwb">총 ${cDTO.c_storeCount }개</i> 입니다.
                                                </span>
                                            </p>
                                            <p>
                                                <span>
                                                    ${areaName} 지역의 ${cDTO.c_comName } 점포수는 <i class="fc-red fwb">${fDTO[0].f_franchiseeEa }개</i> 입니다.
                                                </span>
                                            </p>
                                            <p>
                                                <span>
                                                    ${cDTO.c_comName }은(는) ${areaName} 지역 ${cDTO.c_type } 업종 프렌차이즈 중 <i class="fc-red fwb">
                                                        <fmt:formatNumber type="number" pattern="0.00" value="${ ((num2*100) - ((num2*100)%1)) * (1/100)   } " />%
                                                    </i>를 차지합니다.
                                                </span>
                                            </p>
                                            <p>
                                                <span>
                                                    ${areaName} 지역에는 전국 ${cDTO.c_comName } 매장 중 <i class="fc-red fwb">
                                                        <fmt:formatNumber type="number" pattern="0.00" value="${ ((num*100) - ((num*100)%1)) * (1/100)   } " />%
                                                    </i>가 있습니다.
                                                </span>
                                            </p>
                                            <p>
                                                <span>
                                                    이 데이터는 <i class="fc-red fwb">${fDTO[0].f_year} 기준</i>입니다.
                                                </span>
                                            </p>
                                        </div>
                                        <div class="inwrap fx jc">
                                            <div class="doughnutBox fx fdc">
                                                <div class="doughnut doughnut1">
                                                    <span class="center">
                                                        <strong><fmt:formatNumber type="number" pattern="0.00" value="${ ((num2*100) - ((num2*100)%1)) * (1/100)   } " />%</strong>
                                                    </span>
                                                </div>
                                                <small class="tc"><strong>${areaName} ${cDTO.c_comName } 매장 수</br>/ 전국 ${cDTO.c_type } 프랜차이즈 매장 수</strong></small>
                                            </div>
                                            <div class="doughnutBox fx fdc">
                                                <div class="doughnut doughnut2">
                                                    <span class="center">
                                                        <strong><fmt:formatNumber type="number" pattern="0.00" value="${ ((num*100) - ((num*100)%1)) * (1/100)   } " />%</strong>
                                                    </span>
                                                </div>
                                                <small class="tc"><strong>${areaName} ${cDTO.c_comName } 매장 수</br>/ 전국 ${cDTO.c_comName } 매장 수</strong></small>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                            <!-- brand/company info tab(브랜드 및 회사 정보)-->
                            <div class="tab_brand">
                                <div class="fx jsb">
                                    <div class="tab_inwrap">
                                        <h3>브랜드 정보</h3>
                                        <table>
                                            <!-- <tr>
                                                <th>영업표지명<br>(브랜드명)</th>
                                                <td>${cDTO.c_comName } </td>
                                            </tr>
                                            <tr>
                                                <th>회사분류</th>
                                                <td>${cDTO.c_type } </td>
                                            </tr>
                                            <tr>
                                                <th>총 점포수</th>
                                                <td>${cDTO.c_storeCount } </td>
                                            </tr> -->
                                            <tr>
                                                <th>영업표지명<br>(브랜드명)</th>
                                                <td>
                                                    <a style="text-decoration : underline;" href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${cDTO.c_comName }' target='_blank'><span
                                                            class="fc-red">${cDTO.c_comName }</span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <!-- 업종분류?? -->
                                                <th>회사분류</th>
                                                <td>${cDTO.c_type }</td>
                                            </tr>
                                            <tr>
                                                <th>총 점포수</th>
                                                <td>${cDTO.c_storeCount }</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="tab_inwrap">
                                        <h3>기업 정보</h3>
                                        <table>
                                            <tr>
                                                <th>상호명</th>
                                                <td>
                                                    <a style="text-decoration : underline;" href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${cDTO.c_comTitle }' target='_blank'><span
                                                            class="fc-red">${cDTO.c_comTitle }</span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>회사대표</th>
                                                <td>${cDTO.c_comBoss }</td>
                                            </tr>
                                            <tr>
                                                <th>사업자유형</th>
                                                <td>${cDTO.c_comBm }</td>
                                            </tr>
                                            <tr>
                                                <th>회사주소</th>
                                                <td>${cDTO.c_comAddr }</td>
                                            </tr>
                                            <tr>
                                                <th>대표번호</th>
                                                <td>${cDTO.c_comNum } </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!-- company info tab (기업 정보) -->
                            <!-- <div class="tab_com">
                            </div> -->
                        </div>
                        <!-- </div> -->
                        <span class="line mt-A mb-A"></span>
                        <!-- ## tab footer ##-->
                        <div class="tab_footer center-f">
                            <div class="inwrap btn_area">
                                <!-- <button type="button" onclick="location.href='/diagnosis/diagnosisMain';"> 다시 검색하기</button> -->
                                <!-- <button type="button" onclick="location.href='/franchise/incomeCalcMain?comName=${comName}';"> ${comName}(으)로 예상순이익 계산해보기</button> -->
                                <button type="button" onclick="location.href='/diagnosis/diagnosisMain';"> 다른 브랜드 검색하기</button>
                                <button type="button" onclick="location.href='/franchise/incomeCalcMain?comName=${comName}';"> ${comName}(으)로 예상순이익 계산해보기</button>
                            </div>
                        </div>

                    </div>

                </div>
            </div>


            <script>
                $(function() {
                    /// =======================================  ///
                    // 매출 비교 그래프 차트 그리기
                    /// =======================================  ///
                    let fchaAvg = "${cDTO.c_tAvgSales/100}"; // 프랜차이즈 평균
                    let areaAvg = "${avgSales}"; // 선택 프차,지역 평균
                    let allAvg = "${avgSalesAll}"; // 전국 업종 평균
                    var values = [fchaAvg, areaAvg, allAvg];
                    // var values1 = [300, 500];
                    // var values2 = [300, 200];
                    // var values = [${cDTO.c_tAvgSales/100},${avgSales},${avgSalesAll}];
                    drawChart(values, "#chart", 10)

                    // drawChart(values1,"#chart_1",10)
                    // drawChart(values2,"#chart_2",10)

                    function drawChart(data, selector, padding) {
                        var max = Math.max.apply(Math, data);
                        var chart = document.querySelector(selector);
                        // var barwidth = ((chart.offsetWidth-(values.length-1)*padding-(data.length)*10)/data.length);
                        var barwidth = ((chart.offsetWidth - 1 * padding - (data.length) * 10) / data.length);
                        var sum = data.reduce(function(pv, cv) {
                            return pv + cv;
                        }, 0);
                        var left = 0;
                        for (var i in data) {
                            var newbar = document.createElement('div');
                            newbar.setAttribute("class", "bar");
                            newbar.style.width = barwidth + "px";
                            newbar.style.height = ((data[i] / max) * 100) + "%";
                            newbar.style.left = left + "px";
                            chart.appendChild(newbar);
                            left += (barwidth + padding + 10);
                        }
                    }

                    /// =======================================  ///
                    // 가맹현황 원형차트 그리기
                    /// =======================================  ///
                    const doughnut1 = document.querySelector('.doughnut1');
                    const doughnut2 = document.querySelector('.doughnut2');
                    const a = "${fDTO[0].f_franchiseeEa/cDTO.c_storeCount*100}";
                    const b = "${fDTO[0].f_franchiseeEa / allFchaEA*100}";

                    const makeChart = (percent, classname, color) => {
                        let i = 1;
                        let doughnutFn = setInterval(function() {
                            if (i < percent) {
                                colorFn(i, classname, color);
                                i++;
                            } else {
                                clearInterval(doughnutFn);
                            }
                        }, 10);
                    }

                    const colorFn = (i, classname, color) => {
                        classname.style.background = "conic-gradient(" + color + " 0% " + i + "%, #dedede " + i + "% 100%)";
                    }

                    // 도넛 차트 1번
                    makeChart(b, doughnut1, 'var(--blue)');
                    // 도넛 차트 2번
                    makeChart(a, doughnut2, '#0A174E');

                    const replay = () => {
                        // 도넛 차트 1번
                        makeChart(b, doughnut1, 'var(--blue)');
                        // 도넛 차트 2번
                        makeChart(a, doughnut2, '#0A174E');
                    }

                    /// =======================================  ///
                    // 테이블에 있는 값 콤마 찍기 / 화폐 단위 자동 추가
                    /// =======================================  ///
                    $('.numTrans').each(function(i, e) {
                        num = $(this).text();
                        num = parseInt(num).toLocaleString('ko-KR');
                        // console.log(num);
                        if ($(this).closest('table').length > 0) {
                            $(this).text(num + '만원');
                        } else {
                            $(this).text(num);
                        }
                    });

                    /// =======================================  ///
                    // 차트에 텍스트 ()로 길어지는 곳 split
                    /// =======================================  ///
                    $('.category_num p').each(function(i, e) {
                        var comNm = $(this).text().split('(')[0];
                        // console.log(comNm);
                        $(this).text(comNm);
                    });
                    // $('.tab_fc td').each(function(i,e){
                    //     num = $(this).text();
                    //     num = parseInt(num).toLocaleString('ko-KR');
                    //     // console.log(num);
                    //     $(this).text(num+'원');
                    // });

                    /// =======================================  ///
                    // 탭 클릭 시 컨텐츠 전환
                    /// =======================================  ///
                    $('.tab_btn li').on('click', function() {
                        let idx = $(this).index('.tab_btn li')
                        // console.log($(this).index('.tab_btn li'));
                        $('.tab_btn li').removeClass('on');
                        $(this).addClass('on');
                        $('.tab_cont > div').hide();
                        $('.tab_cont > div').eq(idx).fadeIn();

                        replay();
                    });

                });

            </script>
<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp" %>
