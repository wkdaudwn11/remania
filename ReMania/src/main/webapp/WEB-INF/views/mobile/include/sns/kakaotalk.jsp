<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('52c7a2908466f7b1babc402d0c1891d8');

	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인완료.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(response) {
					var email = response.id;
		      		var name = response.properties.nickname;
		      		
	      			var loginForm = document.getElementById('loginForm');
	      			loginForm.email.value = email;
	      			loginForm.name.value = name;
	      			loginForm.sns.value = "kakaotalk";
	      			loginForm.submit();
				},
				fail : function(error) {
					alert('정보를 불러 올 수 없습니다.');
				}
			});
		},
		fail : function(err) {
			alert('카카오톡 서버와 연결 할 수 없습니다.');
		}
	});
	//]]>

	function kakaoLogOut() {
		Kakao.Auth.logout();
		Kakao.cleanup();
	}
</script>

<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('52c7a2908466f7b1babc402d0c1891d8');
	
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				// 로그인완료.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						console.log(res.id);
						console.log(res.properties.nickname);
						//$('#id').val(res.id);
						//$('#nick_name').val(res.properties.nickname);
					},
					fail : function(error) {
						alert('정보를 불러 올 수 없습니다.');
					}
				});
			},
			fail : function(err) {
				alert('카카오톡 서버와 연결 할 수 없습니다.');
			}
		});
	}

	// 카카오 로그아웃
	function kakaoLogOut() {
		console.log('카톡 로그아웃');
		Kakao.Auth.logout();
		Kakao.cleanup();
	}
</script> -->