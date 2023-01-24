$(function(){

	communication = new Communication();
	//let domain = "http://localhost:8080";
	let domain = "http://jaehoon.co.kr";
	
    // ============================================================
    // ============ Header ========================================
    // ============================================================
	
	var token = document.cookie.indexOf('token');
    console.log("token : " + token);
    // 로그인상태 0
    if(token == 0){
    	$('#logoutDiv').css('display','flex');
	}else{
		$('#loginDiv').css('display','flex');
	}
	
    // 메뉴 마우스 오버시 디자인 나타나기
    $('.gnb > li').hover(function(){
        $(this).addClass('active');
    },function(){
        $(this).removeClass('active');
    });
    // 하위메뉴 있는 메뉴에 마우스 오버시 하위 메뉴 나타나기
    $('.depth').hover(function(){
        $(this).find('div').fadeIn();
    },function(){
        $(this).find('div').fadeOut();
    });
    // 회원가입 버튼 클릭시
    $("#signupBtn").on("click",function(e){
		console.log("회원가입 버튼 클릭");
		let id = $("#m_id").val();
		let pw = $("#m_pw").val();
		let email = $("#m_email").val(); 
		let phone = $("#m_phone").val(); 
		let ping = $("#m_ping").val(); 
		
		console.log("id : " + id);
		console.log("pw : " + pw);
		console.log("email : " + email);
		console.log("phone : " + phone);
		console.log("ping : " + ping);
		
		res = communication.userJoin(id,pw,email,phone,ping);
		

	}); //$("#signupBtn")
	// 로그인 버튼 클릭시
	$("#loginBtn").on("click",function(e){
		console.log("로그인버튼 클릭");

		let id = $("#m_id").val();
		let pw = $("#m_pw").val();
		res = communication.loginCheck(id,pw);
		console.log("res : " + res);

		if(res == 200){
			console.log("res가 200임");
			alert("로그인 성공");
			//setTimeout("window.location = 'main'", 1000);
			location.replace("main");
			
			//location.href = 'main';
		}else if(res == 400){
			alert("아이디 및 비밀번호 오입력");
		}else if(res == 401){
			alert("비밀번호 5회이상 오입력으로 인한 계정 잠금");
		}
	}); //$("#loginBtn")
	//로그아웃 버튼 클릭시
	$("#logoutBtn").on("click",function(e){
		console.log("로그아웃 쿠키삭제");
		var deleteCookie = function(name) {
	    	document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT; path=/';
	  	}
	  	deleteCookie('token');
		

		setTimeout("window.location = 'main'", 1000);
		
	});
	//마이페이지 버튼 클릭시 
	$("#mypageBtn").on("click",function(e){
		function getCookie(cName) {
			cName = cName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cName);
			var cValue = '';
			if(start != -1){
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
			cValue = cookieData.substring(start, end);
			}
			return unescape(cValue);
		}
		var token = getCookie("token");
		
		$.ajax({
            url:domain+'/Member/mypage',
            method:'POST',
            dataType:'JSON',
            data:{
                'token':token
            },
            async: false,
            success:function(data){
                console.log("통신성공");
                console.log(data.data);
                
            },
			error:function(){		 
				console.log("통신에러");
			}
        });
		

	}); // $("#mypageBtn").on
	
	// (모바일) 헤더 햄버거 버튼 클릭
	$('#ham').on('click',function(){
		$(this).toggleClass('on');
		$(".header_menu").toggleClass('active');
	});

    // ============================================================
    // ============ form ==========================================
    // ============================================================

    // form 내부에서 엔터를 눌러야하는 곳에선 엔터눌렀을 때 submit 동작시키기
    $('.inputTrigger').on('keypress', function(e){
        if(e.keyCode == '13'){
            $(this).closest('form').find('[type="submit"]').tigger('click');
        }
    });

    $('#resultForm input[type="number"]').each(function(){
        $(this).closest('td').addClass('pr');
        $(this).after('<span class="unit-money">만원</span>');
    });

});
