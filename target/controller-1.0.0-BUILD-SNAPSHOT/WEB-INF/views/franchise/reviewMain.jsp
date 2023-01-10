<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>

<!-- contents -->
<div id="contents" class="contents reviewMain page" data-id="reviewMain">
	<section class="section s-search">
		<h2 class="tc pb-A">브랜드 리뷰 검색하기</h2>
		<div class="layout_wrap pt-B">
			<div class="countBox center-f">
				<div class="imgBox">
					<img src="../img/review/map_pin.gif" alt="">
				</div>
				<div class="txtBox">
					<span>등록되어있는 <br>
						브랜드 수 : <b>800</b></span>
				</div>
			</div>
			<div class="searchBox">
				<form action="/franchise/reviewSearch" method="get" class="fx jsb alc searchArr">
					<select id="comSel" class="comSel designSel" name="comSel">
						<option value="all" selected>전체</option>
						<option value="chicken">치킨</option>
						<option value="pizza">피자</option>
					</select>
					<input type="search" id="comName" name="comName" value="" placeholder="브랜드명을 입력해보세요.">
					<button type="submit" id="search">검색</button>
				</form>
			</div>
		</div>
	</section>
	<!-- reviewMain -->
	<section class="section s-swiper">
		<div class="layout_wrap pr">
			<!-- Slider main container -->
			<div class="swiper reviewMain-swiper">
				<!-- Additional required wrapper -->
				<ul class="swiper-wrapper">
					<!-- Slides (3) repeat-->
					<li class="swiper-slide"><a href="#" class="inwrap img_r">
							<div class="brand center-t">
								<div class="brand_img img_r"></div>
								<div class="brand_name">
									피자마루1
									<div class="brand_rate">4.8점</div>
								</div>
							</div>
					</a></li>
					<li class="swiper-slide"><a href="#" class="inwrap img_r">
							<div class="brand center-t">
								<div class="brand_img img_r"></div>
								<div class="brand_name">
									피자마루2
									<div class="brand_rate">4.8점</div>
								</div>
							</div>
					</a></li>
					<li class="swiper-slide"><a href="#" class="inwrap img_r">
							<div class="brand center-t">
								<div class="brand_img img_r"></div>
								<div class="brand_name">
									피자마루3
									<div class="brand_rate">4.8점</div>
								</div>
							</div>
					</a></li>

					<li class="swiper-slide"><a href="#" class="inwrap img_r">
							<div class="brand center-t">
								<div class="brand_img img_r"></div>
								<div class="brand_name">
									피자마루4
									<div class="brand_rate">4.8점</div>
								</div>
							</div>
					</a></li>
					<li class="swiper-slide"><a href="#" class="inwrap img_r">
							<div class="brand center-t">
								<div class="brand_img img_r"></div>
								<div class="brand_name">
									피자마루5
									<div class="brand_rate">4.8점</div>
								</div>
							</div>
					</a></li>
					<li class="swiper-slide"><a href="#" class="inwrap img_r">
							<div class="brand center-t">
								<div class="brand_img img_r"></div>
								<div class="brand_name">
									피자마루6
									<div class="brand_rate">4.8점</div>
								</div>
							</div>
					</a></li>

				</ul>
			</div>
			<div class="swiper-button">
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
			<!-- //swiper -->
		</div>
	</section>
</div>
<!-- //contents -->
    <script>
        $(function(){
            var reviewMain = new Swiper('.reviewMain-swiper', {
                navigation: {
                    nextEl: '.s-swiper .swiper-button-next',
                    prevEl: '.s-swiper .swiper-button-prev'
                },
                autoplay: true,
                loop: true,
                speed: 1500,
                slidesPerView: 3,
                spaceBetween: 30,
                slidesPerGroup: 1,
                observer: true,
                observeParents: true,
                breakpoints:{
                    769:{
                        // slidesPerView: 2.2,
                        // spaceBetween: 22
                    },
                    1025:{
                        // slidesPerView: 3,
                        // spaceBetween: 38.5
                    }
                },
            });
        });
    </script>
    <!-- //wrap -->

<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>
