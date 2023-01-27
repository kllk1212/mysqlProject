

let domain = "http://localhost:8080";
//let domain = "http://jaehoon.co.kr";

let key = "jaehoon";


class Encryption {

    /**
     * @var integer Return encrypt method or Cipher method number. (128, 192, 256)
     */
    get encryptMethodLength() {
        var encryptMethod = this.encryptMethod;
        // get only number from string.
        // @link https://stackoverflow.com/a/10003709/128761 Reference.
        var aesNumber = encryptMethod.match(/\d+/)[0];
        return parseInt(aesNumber);
    }// encryptMethodLength


    /**
     * @var integer Return cipher method divide by 8. example: AES number 256 will be 256/8 = 32.
     */
    get encryptKeySize() {
        var aesNumber = this.encryptMethodLength;
        return parseInt(aesNumber / 8);
    }// encryptKeySize


    /**
     * @link http://php.net/manual/en/function.openssl-get-cipher-methods.php Refer to available methods in PHP if we are working between JS & PHP encryption.
     * @var string Cipher method.
     *              Recommended AES-128-CBC, AES-192-CBC, AES-256-CBC
     *              due to there is no `openssl_cipher_iv_length()` function in JavaScript
     *              and all of these methods are known as 16 in iv_length.
     */
    get encryptMethod() {
        return 'AES-256-CBC';
    }// encryptMethod


    /**
     * Decrypt string.
     *
     * @link https://stackoverflow.com/questions/41222162/encrypt-in-php-openssl-and-decrypt-in-javascript-cryptojs Reference.
     * @link https://stackoverflow.com/questions/25492179/decode-a-base64-string-using-cryptojs Crypto JS base64 encode/decode reference.
     * @param string encryptedString The encrypted string to be decrypt.
     * @param string key The key.
     * @return string Return decrypted string.
     */
    decrypt(encryptedString) {
		console.log("디코딩시작");
		console.log("이게맞음");
		console.log("서버에서 넘어온 데이터 : " + encryptedString)
        var json = JSON.parse(CryptoJS.enc.Utf8.stringify(CryptoJS.enc.Base64.parse(encryptedString)));

        var salt = CryptoJS.enc.Hex.parse(json.salt);
        var iv = CryptoJS.enc.Hex.parse(json.iv);

        var encrypted = json.ciphertext;// no need to base64 decode.
		console.log("encrypted : " + encrypted);        

        var iterations = parseInt(json.iterations);
        if (iterations <= 0) {
            iterations = 999;
        }
        console.log("iterations : " + iterations);    
        var encryptMethodLength = (this.encryptMethodLength/4);// example: AES number is 256 / 4 = 64
        var hashKey = CryptoJS.PBKDF2(key, salt, {'hasher': CryptoJS.algo.SHA512, 'keySize': (encryptMethodLength/8), 'iterations': iterations});
        var decrypted = CryptoJS.AES.decrypt(encrypted, hashKey, {'mode': CryptoJS.mode.CBC, 'iv': iv});

		console.log("복호화된 데이터 : " +decrypted.toString(CryptoJS.enc.Utf8));
        return decrypted.toString(CryptoJS.enc.Utf8);
    }// decrypt


    /**
     * Encrypt string.
     *
     * @link https://stackoverflow.com/questions/41222162/encrypt-in-php-openssl-and-decrypt-in-javascript-cryptojs Reference.
     * @link https://stackoverflow.com/questions/25492179/decode-a-base64-string-using-cryptojs Crypto JS base64 encode/decode reference.
     * @param string string The original string to be encrypt.
     * @param string key The key.
     * @return string Return encrypted string.
     */
    encrypt(string) {

        console.log(string);
        var iv = CryptoJS.lib.WordArray.random(16);// the reason to be 16, please read on `encryptMethod` property.
        console.log("iv : " + iv);
        var salt = CryptoJS.lib.WordArray.random(256);
        console.log("salt : " + salt);
        var iterations = 999;
        var encryptMethodLength = (this.encryptMethodLength/4);// example: AES number is s = 64
        console.log("encryptMethodLength : " + encryptMethodLength);
        console.log("key : " + key);
        													//512비트 생성 (64바이트)
        var hashKey = CryptoJS.PBKDF2(key, salt, {'hasher': CryptoJS.algo.SHA512, 'keySize': (encryptMethodLength/8), 'iterations': iterations});
		console.log("*********"+hashKey);
		console.log(CryptoJS.algo.SHA512);
		console.log(encryptMethodLength/8);
        var encrypted = CryptoJS.AES.encrypt(string, hashKey, {'mode': CryptoJS.mode.CBC, 'iv': iv});
        var encryptedString = CryptoJS.enc.Base64.stringify(encrypted.ciphertext);
        console.log(encryptedString);



        var output = {
            'ciphertext': encryptedString,
            'iv': CryptoJS.enc.Hex.stringify(iv),
            'salt': CryptoJS.enc.Hex.stringify(salt),
            'iterations': iterations
        };

		
        return CryptoJS.enc.Base64.stringify(CryptoJS.enc.Utf8.parse(JSON.stringify(output)));
    }// encrypt


}

function decode(text){
	encryption = new Encryption();
	encryption.decrypt(text);
}


class Communication{
    constructor(){
        this.encryption = new Encryption();
    }
    loginCheck(id,pw){

        const obj = new Object;

        obj.id = id;
        obj.pw = pw;
		console.log(obj);
        const token = this.encryption.encrypt(JSON.stringify(obj));
        console.log(token);
        var result;

        $.ajax({
            url:domain+'/Member/actLogin',
            method:'POST',
            dataType:'JSON',
            data:{
                'token':token
            },
            async: false,
            success:function(res){
				console.log("통신성공");
				console.log(res);
				console.log(res.code);
				console.log(res.token);
				
                if(res.code=="200"){
					console.log("쿠키생성");
					
                    //document.cookie = "token="+res.token+"; Secure";

                    //document.cookie = "token="+res.token+"; max-age=3600; path=/"; domain=" + domain +";
                    var setCookie = function(name, value, exp) {
			    		var date = new Date();
				    	date.setTime(date.getTime() + exp*24*60*60*1000);
				    	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
				    };
				    // setCookie(변수이름, 변수값, 날짜(1=1일));
		  			setCookie("token", res.token, 1);
		    
					result = res.code;
                }else if(res.code == "400"){
                	result = res.code;
                }else if(res.code == "401"){
                	result = res.code;
                }
            },error:function(res){
				console.log(res);
				console.log("통신에러");

            }
        });

        return result;
    }

    chkLogin(){
        var accessToken = getCookie('accessToken');
        var result;

        const obj = new Object;

        obj.Authorization = accessToken;

        const token = this.encryption.encrypt(JSON.stringify(obj));

        $.ajax({
            url:domain+'/Member/chkLogin',
            method:'POST',
            dataType:'JSON',
            data:{
                'token':token
            },
            async: false,
            success:function(res){
                result = res;
            }
        });

        return result;
    }


    logOut(sno){

        var accessToken = getCookie('accessToken');
        var result;

        const obj = new Object;

        obj.Authorization = accessToken;
        obj.sno = sno;

        const token = this.encryption.encrypt(JSON.stringify(obj));

        $.ajax({
            url:domain+'/Member/delToken',
            method:'POST',
            dataType:'JSON',
            data:{
                'token':token
            },
            async: false,
            success:function(res){
                result = res;
                if(res.result=='success'){
                    document.cookie = "refreshToken=; Secure";
                    document.cookie = "accessToken=; Secure";
                }
            }
        });

        return result;

    }


    idConfirm(id){

        const obj = new Object;
        var result;

        obj.id = id;

        const token = this.encryption.encrypt(JSON.stringify(obj));

        $.ajax({
            url:domain+'/Member/chkIdOverlap',
            method:'POST',
            dataType:'JSON',
            data:{
                'token':token
            },
            async: false,
            success:function(res){
                result = res;
            }
        });

        return result;

    }

    userJoin(id,pw,email,phone,ping){

        const obj = new Object;
        var result;

        obj.id = id;
        obj.pw = pw;
        obj.email = email;
        obj.phone = phone;
        obj.ping = ping;

        const token = this.encryption.encrypt(JSON.stringify(obj));

        $.ajax({
            url:domain+'/Member/signup',
            method:'POST',
            dataType:'JSON',
            data:{
                'token':token
            },
            async: false,
            success:function(res){
                result = res;
                console.log("*******************");
            }
        });

        return result;


    }

    loginConfirm(sno,pw){

      const obj = new Object;
      var result;

      obj.sno = sno;
      obj.pw = pw;

      const token = this.encryption.encrypt(JSON.stringify(obj));

      $.ajax({
        url:domain+'/Member/correctData',
        method:'POST',
        dataType:'JSON',
        data:{
          'token':token
        },
        async: false,
        success:function(res){
          result = res;
        }
      });

      return result;
    }

    loadData(sno){

      const obj = new Object;
      var result;

      obj.sno = sno;

      const token = this.encryption.encrypt(JSON.stringify(obj));

      $.ajax({
        url:domain+'/Member/getData',
        method:'POST',
        dataType:'JSON',
        data:{
          'token':token
        },
        async: false,
        success:function(res){
          result = res;
        }
      });

      return result;
    }

    updateUserData(id,pw,email,phone,ping){

      const obj = new Object;
      var result;

      obj.id = id;
      obj.pw = pw;
      obj.email = email;
      obj.phone = phone;
      obj.ping = ping;

      const token = this.encryption.encrypt(JSON.stringify(obj));

      $.ajax({
        url:domain+'/Member/updateUserData',
        method:'POST',
        dataType:'JSON',
        data:{
          'token':token
        },
        async: false,
        success:function(res){
          //result = res;
          //console.log(result);
          //console.log("********************************연결성공");
          //window.location = domain + '/main/main';
        }
      });

      return result;
    }
}
