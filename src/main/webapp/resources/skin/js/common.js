$(function(){

	communication = new Communication();

	
    // ============================================================
    // ============ Header ========================================
    // ============================================================

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
	$("#loginBtn").on("click",function(e){
		console.log("로그인버튼 클릭");

		let id = $("#m_id").val();
		let pw = $("#m_pw").val();
		res = communication.loginCheck(id,pw);
		console.log("res : " + res);

		if(res == 200){
			console.log("res가 200임");
			//alert("로그인 성공");
			setTimeout("window.location = 'main'", 1000);
			//location.replace("main");
			
			//location.href = 'main';
		}else if(res == 400){
			alert("아이디 및 비밀번호 오입력");
		}else if(res == 401){
			alert("비밀번호 5회이상 오입력으로 인한 계정 잠금");
		}
	}); //$("#loginBtn")
	$("#logoutBtn").on("click",function(e){
		console.log("로그아웃 쿠키삭제");
		deleteAllCookies();
		document.cookie = 'token=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
		setTimeout("window.location = 'main'", 1000);
		
	});
	function deleteAllCookies() {
	    var cookies = document.cookie.split(";");
		console.log("쿠키삭제");
		console.log(cookies);
	    for (var i = 0; i < cookies.length; i++) {
	        var cookie = cookies[i];
	        var eqPos = cookie.indexOf("=");
	        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
	        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
	    }
	}		


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
