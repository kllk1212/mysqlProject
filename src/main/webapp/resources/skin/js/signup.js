$(function(){

	communication = new Communication();
	let domain = "http://localhost:8080";
	//let domain = "http://jaehoon.co.kr";
	
	
	var token = document.cookie.indexOf('token');
	
	
	$(document).ready(function(){
		// 띄어쓰기 사용불가
    	$(document).bind('keydown',function(e){
        	if ( e.keyCode == 32 /* F12 */) {
            	e.preventDefault();
                e.returnValue = false;
        	}
    	});           
    });
	

    // 회원가입 아이디 중복체크 클릭시
    $("#idChk").on("click",function(e){

    	// 띄어쓰기 제거
    	let id = $("#m_id").val().replace(/ /g, '');
    	
    	if(id.length < 5){
    		alert("아이디가 너무 짧습니다. 5글자 이상 입력해주세요");
    		return false;
    	}
    	if(checkBlank(id) == true){
    		$.trim($("#m_id").val());
    		$("#m_id").val('');
			alert("아이디에 띄어쓰기는 사용 불가능 합니다.");
			return false;
		} 
    	console.log("아이디중복체크 클릭");
 		$.ajax({
            url:domain+'/Member/idChk',
            method:'POST',
            dataType:'JSON',
            data:{
                'id':id
            },
            async: false,
            success:function(data){
                console.log(data.result);
                // 중복시 1 사용가능시 0
                if(data.result == 1 ){
                	alert("중복된 아이디 입니다.");
                }else if(data.result == 0) {
                	alert("가입가능한 아이디 입니다.");
                	$("#m_id").val(id);
                	$("#m_id").attr("readonly",true);
                	$("#idChk").hide();
                }
                
            },
			error:function(){		 
				console.log("통신에러");
			}
        });   	
    	
    	
    }); //$("#idChk")
    
    // 회원가입 닉네임 중복체크 클릭시
    $("#nickChk").on("click",function(e){
    	let nickName = $("#m_nickName").val().replace(/ /g, '');
    	if(nickName.length < 2){
    		alert("닉네임이 너무 짧습니다. 2글자 이상 입력해주세요");
    		return false;
    	}
    	if(checkBlank(nickName) == true){
    		$.trim($("#m_nickName").val());
    		$("#m_nickName").val('');
			alert("닉네임에 띄어쓰기는 사용 불가능 합니다.");
			return false;
		} 
     	$.ajax({
            url:domain+'/Member/nickChk',
            method:'POST',
            dataType:'JSON',
            data:{
                'nickName':nickName
            },
            async: false,
            success:function(data){
                console.log(data.result);
                // 중복시 1 사용가능시 0
                if(data.result == 1 ){
                	alert("중복된 닉네임 입니다.");
                }else if(data.result == 0) {
                	alert("사용가능한 닉네임 입니다.");
                	$("#m_nickName").val(nickName);
                	$("#m_nickName").attr("readonly",true);
                	$("#nickChk").hide();
                }
                
            },
			error:function(){		 
				console.log("통신에러");
			}
        });   	
    	
    
    }); //$("#nickChk")
    
    // 회원가입 새로고침 클릭시
    $("#resetBtn").on("click",function(e){
    	location.reload();
    });
      
    // 회원가입 버튼 클릭시
    $("#signupBtn").on("click",function(e){
		console.log("회원가입 버튼 클릭");
		let id = $("#m_id").val();
		let pw = $("#m_pw").val();
		let nickName = $("#m_nickName").val(); 
		let phone = $("#m_phone").val();
		let gender = $("#m_gender option:selected").val(); 
		let ping = $("#m_ping").val(); 
		
		let email = $("#m_email").val();
		
		if(pw.length < 5){
			alert("비밀번호 길이가 짧습니다. 5자리 이상으로 만들어주세요.");
			return false;
		}
		if(checkKor(pw) == true){
			alert("비밀번호엔 한글은 사용할 수 없습니다.");
			return false;
		} 
		
		if(email_check(email) == false){
			alert("이메일 형식이 올바르지 않습니다.");
			return false;
		}  
		if(phone.length != 11){
			alert("휴대폰 번호의 길이가 짧습니다.");
			return false;
		}
		
		
		if( $('#idChk').is(':visible') == false && $('#nickChk').is(':visible') == false){
			res = communication.userJoin(id,pw,nickName,email,phone,gender,ping);
			
		}else{
			alert("중복체크를 전부 체크해주세요.");
			return false;
		}

	}); //$("#signupBtn")
	
	// 네이버 회원가입 버튼 클릭시
	$("#naverSignupBtn").on("click",function(e){
		let id = $("#m_id").val();
		let nickName = $("#m_nickName").val();
		let email = $("#m_email").val();
		let phone = $("#m_phone").val();
		let gender = $("#m_gender option:selected").val(); 
		let ping = $("#m_ping").val(); 
		
		if(phone.length != 11){
			alert("휴대폰 번호의 길이가 짧습니다.");
			return false;
		}
		
		if($('#nickChk').is(':visible') == false){

			res = communication.userJoinNaver(id,nickName,email,phone,gender,ping);

						
		}else{
			alert("중복체크를 전부 체크해주세요.");
			return false;
		}		
	
	}); //$("#naverSignupBtn")
	// 카카오 회원가입 버튼 클릭시
	$("#kakaoSignupBtn").on("click",function(e){
		console.log("카카오 회원가입 클릭");
		let id = $("#m_id").val();
		let nickName = $("#m_nickName").val();
		let email = $("#m_email").val();
		let phone = $("#m_phone").val();
		let gender = $("#m_gender option:selected").val(); 
		let ping = $("#m_ping").val(); 
		
		
		if(email_check(email) == false){
			alert("이메일 형식이 올바르지 않습니다.");
			return false;
		}  
		if(phone.length != 11){
			alert("휴대폰 번호를 확인해주세요");
			return false;
		}
		
		if($('#nickChk').is(':visible') == false){

			res = communication.userJoinKakao(id,nickName,email,phone,gender,ping);

						
		}else{
			alert("중복체크를 전부 체크해주세요.");
			return false;
		}		
	
	}); //$("#kakaoSignupBtn")
	
	// 띄어쓰기 유효성 체크
	function checkBlank(str) {
	    const regExp =  /^\s+|\s+$/g; 
	    if(regExp.test(str)){
	        return true;
	    }else{
	        return false;
	    }
	}
	
	// 비밀번호 유효성 한글 체크
	function checkKor(str) {
	    const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; 
	    if(regExp.test(str)){
	        return true;
	    }else{
	        return false;
	    }
	}
	function email_check(str) {
	
	    var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	     if(regExp.test(str)){
	        return true;
	    }else{
	        return false;
	    }
	
	}
});
