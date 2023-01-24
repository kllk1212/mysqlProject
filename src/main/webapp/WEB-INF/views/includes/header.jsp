<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <!-- 10월 4일 한글깨져서 헤더 주석
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
      -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">

    <title>창업나무</title>

    <!-- <link rel="icon" href="/{=favicon}" -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/skin/css/main.css?v=<?=time()?>">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/ScrollMagic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/plugins/animation.gsap.js"></script>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script src="/resources/skin/js/jquery.cookie.js"></script>
    <script defer src="/resources/skin/js/common.js"></script>
    <script src="/resources/skin/js/class.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>

    <!-- <script src="https://www.youtube.com/player_api"></script> -->


</head>
<!-- ============================================================================= -->
<!-- ============================================================================= -->

<!-- 마우스드래그금지 -->
<!-- <body ondragstart="return false" onselectstart="return false"> -->

<body>
    <h1 id="Homepage" class="bld">창업나무 홈페이지</h1>
    <!-- wrap -->
    <div id="wrap">
        <!-- container -->
        <div id="container">
            <!-- ======================================== -->
            <!-- header -->
            <header id="header" class="header">
                <div class="header_wrap layout_wrap">
                    <div class="header_left">
                        <div class="header_logo">
                            <a href="../main/main">
                                <img src="../resources/skin/img/common/logo.png" alt="창업나무" class="vP">
                                <img src="../resources/skin//img/common/logoH_tree.png" alt="창업나무" class="vT">
                            </a>
                        </div>
                        <nav class="nav">
                            <ul id="gnb" class="gnb">
                                <li><a href="../main/main">홈</a></li>
                                <li class="depth">
                                    <a href="../diagnosis/diagnosisMain">프렌차이즈 정보</a>
                                    <!-- 
                                    <div>
                                        <ul class="fx">
                                            <li><a href="../franchise/reviewMain">기업평점/리뷰</a></li>
                                            <li><a href="../franchise/rankMain">순위</a></li>
                                            <li><a href="../map/mapSearchMain">지도</a></li>
                                            <li><a href="../diagnosis/diagnosisMain">조건검색</a></li>
                                        </ul>
                                    </div>
                                     -->
                                </li>
                                <li><a href="../franchise/incomeCalcMain">순이익 계산기</a></li>
                                <li><a href="../main/siteInfo">사이트 소개</a></li>
                            </ul>
                        </nav>
                    </div>

                    <div class="header_right">

                        <div class="inwrap" id ="loginDiv">
                            <button type="button" onclick="location.href='../main/login' ">로그인 <span class="vP">및 회원가입</span></button>
                        </div>

                        <div class="inwrap" id ="logoutDiv">
                            <button type="button" id ="logoutBtn">로그아웃</button>
                            <button type="button" onclick="location.href='../main/mypage'">마이페이지</button>
                        </div>

                    </div>

                </div>
            </header>
            <!-- //header -->
            <script>
            $(document).ready(function() {
            	var token = document.cookie.indexOf('token');
            	console.log("token : " + token);
            	// 로그인상태 0
            	if(token == 0){
                    $('#logoutDiv').css('display','flex');
            		// $("#loginDiv").hide();
                }else{
                    $('#loginDiv').css('display','flex');
            	    // $("#loginDiv").show();
            		// $("#logoutDiv").hide();
            	}
  			});
            </script>
