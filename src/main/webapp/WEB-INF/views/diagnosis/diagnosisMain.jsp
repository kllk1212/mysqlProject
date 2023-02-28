<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
            <div id="contents" class="contents diagnosis diagnosisMain page page-break" data-id="diagnosis">


                <h2 class="pt-B tc">프랜차이즈 찾기</h2>

                <!-- button area -->
                <div id="titleConstraint" class="h-btn">
                    <button id="returnSearchBtn">조건검색</button>
                    <button id="normalSearchBtn">일반검색</button>
                </div>

                <div class="layout_wrap pt-B">

                    <div class="layout_wrap_in">

                        <div class="searchWrap">
                            <!-- search: normal (일반검색)-->
                            <section id="normalDiv" class="section searchBox s-search">
                                <div class="searchArr">
                                    <select class="selbox" name="areaNameNomal" id="areaNameNomal">
                                        <option value="서울" selected="selected">서울</option>
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
                                    <input placeholder="기업명을 입력해주세요" type="text" name="comName" value="" id="search">
                                    <button id="normalSearch" type="submit">찾기</button>
                                </div>
                                <div class="guide center-m pt-A">
                                    <div class="commentBox">
                                        <p>정확한 기업명을 입력해주세요.</p>
                                        <p>선택한 기업명의 <i class="fc-red">지역별 데이터</i>를 볼 수 있어요.</p>
                                    </div>
                                    <div class="imgBox">
                                        <img src="../resources/skin/img/diagnosis/global_map.gif" alt="">
                                    </div>
                                </div>
                            </section>

                            <!-- search: constraint (조건검색)-->
                            <section id="constraintDiv" class="section searchBox s-search"><!-- Constraint 제약이라는 뜻이라함  -->

                                <form method="get">
                                    <div class="guide center-m Pt0">
                                        <div class="commentBox">
                                            <p>각 옵션별 항목을 선택해주세요.</p>
                                            <p>옵션에 맞는 <i class="fc-red">상위 5개 기업</i>의 <i class="fc-red">조건별 데이터</i>를 볼 수 있어요.</p>
                                        </div>
                                        <!-- <div class="imgBox">
                                            <img src="../img/diagnosis/global_map.gif" alt="">
                                        </div> -->
                                    </div>
                                    <ul id="optlist" class="optlist">
                                        <!-- 첫번째 옵션: type(테마) -->
                                        <li class="optlist_item optlist_type">
                                            <h3>테마</h3>
                                            <ul class="selboxTrigger fx" id="foodType">
                                                <li class="on">
                                                    <div class="imgBox"></div>
                                                    <span class="">치킨</span>
                                                </li>
                                                <li>
                                                    <div class="imgBox"></div>
                                                    <span class="">피자</span>
                                                </li>
                                                <li>
                                                    <div class="imgBox"></div>
                                                    <span class="">주점</span>
                                                </li>
                                                <li>
                                                    <div class="imgBox"></div>
                                                    <span class="">커피</span>
                                                </li>
                                            </ul>
                                            <select id="type" name="type" class="selbox hidden">
                                                <option value="치킨">치킨</option>
                                                <option value="피자">피자</option>
                                                <option value="커피">커피</option>
                                                <option value="주점">주점</option>
                                            </select>
                                        </li>
                                        <!-- 두번째 옵션: areaName(지역) -->
                                        <li class="optlist_item optlist_area pt-A">
                                            <h3>지역</h3>
                                            <ul class="selboxTrigger" id="area">
                                                <li class="on"><span>서울</span></li>
                                                <li><span>부산</span></li>
                                                <li><span>대구</span></li>
                                                <li><span>인천</span></li>
                                                <li><span>광주</span></li>
                                                <li><span>대전</span></li>
                                                <li><span>울산</span></li>
                                                <li><span>세종</span></li>
                                                <li><span>경기</span></li>
                                                <li><span>강원</span></li>
                                                <li><span>충북</span></li>
                                                <li><span>충남</span></li>
                                                <li><span>전북</span></li>
                                                <li><span>전남</span></li>
                                                <li><span>경북</span></li>
                                                <li><span>경남</span></li>
                                                <li><span>제주</span></li>
                                            </ul>
                                            <select id="areaNameCon" name="areaNameCon" class="selbox hidden">
                                                <option value="서울">서울</option>
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
                                        </li>
                                        <!-- 세번째 옵션: order(정렬) -->
                                        <li class="optlist_item optlist_order pt-A">
                                            <h3>정렬</h3>
                                            <ul class="selboxTrigger" id="order">
                                                <li class="on"><span>매출높은순</span></li>
                                                <li><span>점포많은순</span></li>
                                            </ul>
                                            <select id="constraint" name="constraint"  class="selbox hidden">
                                                <option value="매출높은순">매출높은순</option>
                                                <option value="점포많은순">점포많은순</option>
                                            </select>
                                        </li>
                                    </ul>
                                    <div class="center-f pt-B">
                                        <button type="button" id="searchBtn">선택완료</button>
                                    </div>
                                </form>
                            </section>
                        </div>

                        <section>
                            <form>
                                <table style="height: auto;" id="comNameList">
                                    <!-- 검색한 결과값이 담길 테이블 -->
                                </table>
                            </form>
                        </section>
                    </div>

                </div>
                <!-- //layout_wrap -->
            </div>
            <!-- //contents -->

            <script>
            $(document).ready(function(){
        		$("#normalSearchBtn").removeClass("turnBtn leeActive");
        		$("#normalSearchBtn").addClass("turnBtn");
                $("#normalDiv").hide();		// 그냥 검색하는인풋태그div 숨김

                // 일반 검색할래요 클릭시
                $("#normalSearchBtn").on("click",function(e){
        			$("#normalSearchBtn").removeClass("turnBtn");
        			$("#normalSearchBtn").addClass("turnBtn leeActive");
        			$("#returnSearchBtn").removeClass("turnBtn leeActive");
        			$("#returnSearchBtn").addClass("turnBtn");
                    $("#constraintDiv").hide();	// 조건검색창 숨기기
                    $("#comNameList").hide();	// 조건검색 결과창 숨기기
                    $("#normalDiv").show();		//일반검색 인풋태그div 보이게
                });
                // 조건검색 버튼 클릭시
                $("#returnSearchBtn").on("click",function(e){
        			$("#returnSearchBtn").removeClass("turnBtn");
        			$("#normalSearchBtn").addClass("turnBtn leeActive");
        			$("#normalSearchBtn").removeClass("turnBtn leeActive");
        			$("#normalSearchBtn").addClass("turnBtn");
                    $("#constraintDiv").show(); // 조건검색창 보이기
                    $("#comNameList").hide(); 	// 조건검색 결과창 보이기
                    $("#normalDiv").hide();		//일반검색 인풋태그div 숨김
                });

                // 검색 버튼 클릭시
                $("#searchBtn").on("click",function(e){
                    $("#comNameList").show();
                    let type = $("#type").val();
                    let areaName = $("#areaNameCon").val();
                    let constraint = $("#constraint").val();
                    let comNameListDiv = $("#comNameList");
                    console.log("type : " +type);
                    console.log("areaName : " +areaName);
                    console.log("constraint : " +constraint);
                    $.ajax({
                        type: "GET",
                        url: "/search/searchDataConstraint",
                        data: {"type" : type,"areaName" : areaName,"constraint" : constraint},
                        contentType: "application/json;charset=utf-8",
                        success: function(result){
                            console.log("요청 성공!!!!!");
                            console.log(result);
                            console.log(result.length);
                            let str= "";
                            //str += "<tr><td><a> 검색된 결과 수 : "+result.length +"</a></td></tr>";
                            str += "<tr><td><a><strong> 상위 프랜차이즈 5곳</strong></a></td></tr>";
                            for(let i = 0; i < 5; i++){ //result.length 일단 5개까지만

                                str+= "<tr><td><strong>"+ result[i].l_comName +"</strong></td><td>";
                                str+= "<label class='agree fx alc'>";	// 수정한거
                                str+= "<input type='checkbox' value='"+ result[i].l_comName +"' class='resultBtn' id='"+ result[i].l_comName +"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
                            }
                            str +="<td class='submitBtn' colspan='2'><input type='text' name='comName' class='inputTrigger' readonly><button type='button' onclick='targetFunctionCon();'>(으)로 상세검색</button></td>";
                            comNameListDiv.html(str); // table에 tr td 넣기
                        },
                        error: function(e) {
                            console.log("요청 에러......");
                            console.log(e);
                            comNameListDiv.html(str); // table에 tr td 넣기
                        }
                    }); //ajax
                });// $("#searchBtn") 서치버튼 클릭시 !
                $("#normalSearch").on("click",function(e){
                    $("#comNameList").show();
                    console.log("들어옴");
                    let search = $("#search").val();
                    let comNameListDiv = $("#comNameList");
                    console.log("서치한거 : "+search); // 여기까지 담김
                    let areaNameNomal = $("#areaNameNomal").val();
					console.log("일반검색 지역 : " + areaNameNomal);
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

                                    str+= "<tr><td><strong>"+ result[i].s_comName +"</strong></td><td>";
                                    str+= "<label class='agree fx alc je' id='"+ result[i].s_comName +"'>";
                                    str+= "<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
                                }
                                    //str +="<td><input type='text' name='comName' class='inputTrigger'><button type='button' id='detail'>(으)로 상세검색</button></td>";
                                    str +="<td class='submitBtn' colspan='2'><input type='text' name='comName' class='inputTrigger' id='detailSearchBtn' readonly><button type='button' onclick='targetFunctionNomal();'>(으)로 상세검색</button></td>";
                                comNameListDiv.html(str); // table에 tr td 넣기

                            },
                            error: function(e) {
                                console.log("요청 에러......");
                                console.log(e);
                                str += "<tr><td><a> 검색된 결과가 없습니다</a></td></tr>";
                                comNameListDiv.html(str); // table에 tr td 넣기
                            }
                        }); //ajax
                });// $("#normalSearch")

                // 각 select option 대신 새로 만든 요소를 클릭해도 옵션이 선택되는 것처럼 동작
                /*
                $('.selboxTrigger li').on('click',function(){
                    // select option 변경
                    $(this).closest('.optlist_item').find('.selbox').val($(this).find('span').text());
                    // 클릭한 요소로 border-color 변경
                    $(this).removeClass('on');
                    $(this).siblings('li').removeClass('on');
                    $(this).addClass('on');
                });
                /*
                $('.selboxTrigger li').on('click',function(){
                    // select option 변경
                    $(this).closest('.optlist_item').find('.selbox').val($(this).find('span').text());
                    // 클릭한 요소로 border-color 변경
                    $(this).removeClass('on');
                    $(this).siblings('li').removeClass('on');
                    $(this).addClass('on');
                });*/
                $('#foodType li').on('click',function(){
                    // select option 변경
                    $(this).closest('.optlist_item').find('.selbox').val($(this).find('span').text());
                    // 클릭한 요소로 border-color 변경
                    $(this).removeClass('on');
                    $(this).siblings('li').removeClass('on');
                    $(this).addClass('on');
                    let typeText = $(this).text().trim();
                    console.log(typeText);
                    let type = $("#type").val();
                    console.log("type : " + type)

                });
                $('#area li').on('click',function(){
                    // select option 변경
                    $(this).closest('.optlist_item').find('.selbox').val($(this).find('span').text());
                    // 클릭한 요소로 border-color 변경
                    $(this).removeClass('on');
                    $(this).siblings('li').removeClass('on');
                    $(this).addClass('on');
                    let areaText = $(this).text().trim();
                    console.log(areaText);
                    let areaNameCon = $("#areaNameCon").val();
                    console.log(areaNameCon);

                });
                $('#order li').on('click',function(){
                    // select option 변경
                    $(this).closest('.optlist_item').find('.selbox').val($(this).find('span').text());
                    // 클릭한 요소로 border-color 변경
                    $(this).removeClass('on');
                    $(this).siblings('li').removeClass('on');
                    $(this).addClass('on');
                    //console.log(orderText);
                    let order = $("#constraint").val();
                    console.log("조건검색  1 or 2: " + order);

                });

			
            });//$(document). 시작부분
            function clickCheck(target) { // 체크박스 여러개 체크하지 않게 !!! onclick 이벤트
                document.querySelectorAll(`input[type=checkbox]`)
                    .forEach(el => el.checked = false);
                target.checked = true;
                console.log("이벤트실행");
                if(event.target.checked)  {
                    let result = event.target.value;
                    let areaName = $("#areaName").val();
                    console.log(result);
                    $('input[name=comName').attr('value',result);
                    //window.location='../diagnosis/diagnosisResult?comName='+result+'&areaName='+areaName; // 체크박스 클릭시 바로 페이지이동
                }
            }


            function targetFunctionCon() {
                let areaName = $("#area").val(); //

                let conResult = $("#areaNameCon").val(); // 조건검색 헀을 경우 지역명
                let nomalResult = $("#areaNameNomal").val(); // 일반검색 헀을 경우 지역명

                console.log("조건검색 : " + conResult);
                console.log("일반검색 : " + nomalResult);

                let comName = $(".inputTrigger").val();
                console.log(comName);
                if(comName==null|| comName === null || comName == '' || comName === ''){
                	alert("체크박스를 선택해주세요");
                }else{
	                window.location='../diagnosis/diagnosisResultTest?comName='+comName+'&areaName='+conResult;
                	
                }
                /*
                console.log("areaName : " + areaName);
                console.log("comName : " + comName);
                */
            }

            function targetFunctionNomal() {
                let areaName = $("#areaNameNomal").val(); //
                console.log("일반검색창" + "areaName");

                let conResult = $("#areaNameCon").val(); // 조건검색 헀을 경우 지역명
                let nomalResult = $("#areaNameNomal").val(); // 일반검색 헀을 경우 지역명

                console.log("조건검색 : " + conResult);
                console.log("일반검색 : " + nomalResult);

                let comName = $(".inputTrigger").val();
                console.log(comName);
                if(comName == null|| comName === null || comName == '' || comName === ''){
                	alert("체크박스를 선택해주세요");
                }else{
	                window.location='../diagnosis/diagnosisResultTest?comName='+comName+'&areaName='+nomalResult;
                	
                }
                /*
                console.log("areaName : " + areaName);
                console.log("comName : " + comName);
                */
            }
            </script>

<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp" %>
