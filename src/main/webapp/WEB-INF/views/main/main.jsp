<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>
            <!-- ======================================== -->
            <!-- contents -->
            <div id="contents" class="contents main page" data-id="main">
                <!-- main -->

                    <!-- Slider main container -->
                    <div class="swiper mainBanner">
                        <!-- Additional required wrapper -->
                        <ul class="swiper-wrapper">
                            <!-- Slides (2) repeat-->
                            <li class="swiper-slide">
                                <section class="section s-main banner1">
                                    <div class="layout_wrap fx jsb">
                                        <div class="inwrap">
                                            <h2 class="title fwb">
                                                프렌차이즈는 <span class="fc-light">'선택'</span> <br>
                                                창업 준비를 똑똑하게!
                                            </h2>
                                            <div class="disc commentBox">
                                                <p>우리 지역에 같은 테마가 얼마나 있을까?</p>
                                                <p>어떤 프렌차이즈를 선택해야 마진이 많이 남을까?</p>
                                                <p>가맹 비용을 미리 알아 볼 수는 없을까?</p>
                                            </div>
                                            <button class="mt-A">
                                                <a href="/diagnosis/diagnosisMain">테마별 검색</a>
                                            </button>
                                        </div>
                                        <div class="inwrap imgAni">
                                            <!-- <img src="../img/main/ani_01.gif" alt=""> -->
                                            <!-- <img src="../img/main/ani_02.gif" alt=""> -->
                                            <!-- <img src="../img/main/ani_03.gif" alt=""> -->
                                            <!-- <img src="../img/main/ani_04.gif" alt=""> -->
                                            <img src="../resources/skin/img/main/ani_05.gif" alt="">
                                        </div>
                                    </div>
                                </section>
                            </li>
                            <li class="swiper-slide">

                                <section class="section s-main banner2">
                                    <div class="layout_wrap fx jsb">
                                        <div class="inwrap">
                                            <h2 class="title fwb">
                                                미리 계산하는 <span class="fc-light">'순이익'</span> <br>
                                                예상 매출과 지출을 계산해보자! <br>
                                            </h2>
                                            <div class="disc commentBox">
                                                <p>기업 정보공개서 기반 정확한 매출 정보를 제공</p>
                                                <p>창업시 예상 월 순이익을 한눈에</p>
                                            </div>
                                            <button class="mt-A">
                                                <a href="/franchise/incomeCalcMain">매출 계산기</a>
                                            </button>
                                        </div>
                                        <div class="inwrap imgAni">
                                            <!-- <img src="../img/main/ani_01.gif" alt=""> -->
                                            <!-- <img src="../img/main/ani_02.gif" alt=""> -->
                                            <!-- <img src="../img/main/ani_03.gif" alt=""> -->
                                            <!-- <img src="../img/main/ani_04.gif" alt=""> -->
                                            <img src="../resources/skin/img/main/graph.gif" alt="">
                                        </div>
                                    </div>

                                </section>

                            </li>
                        </ul>
                    </div>
                </div>
            <!-- //contents -->
            <script>

                $(function(){
                    var mainSwiper = new Swiper('.mainBanner', {
                        autoplay: {
                            delay: 3000,
                            pauseOnMouseEnter: true,
                            disableOnInteraction: false,
                        },
                        loop: true,
                        speed: 2000,
                        // spaceBetween: 30,
                    });
                });
            </script>




<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>
