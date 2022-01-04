<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.MemberVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
 	#content {clear: both; width: 100%; height: 100%; }
    .con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
    .login_con {max-width: 1144px; height: 500px; padding: 0 20px; margin: 40px auto; }
    .login_box {width: 1000px; margin: 0 auto; position: relative;}
    .welcome_box {display:block; width: 500px; height: 400px; }
    .welcome_box p {font-size: 40px; text-align: center; margin:  20px 0; vertical-align: middle; font-weight: bold; color: #e22219;}
    .welcome_box p:first-child {padding-top: 100px; color:#000;}
    .login_form_box {display: block; width: 500px; height: 400px; border-left: 1px solid #aaa; position: absolute; top: 0; right: 0;}
    .login_form_box form { width: 500px; height: 400px;}
    .login_form_box form input {display: block; width: 300px; height: 60px; margin: 20px auto; font-size: 20px;}
    .login_form_box form input::placeholder {font-size: 20px; text-indent: 10px;}
    .login_tit {width: 100%; text-align: center; margin: 0 auto; font-size: 30px;}
    .login_btn_box {width: 500px; text-align: center;}
    .login_btn_box button {display: inline-block; width: 200px; height: 68px; margin: 20px; border: 0; font-size: 20px; cursor: pointer; }
    .login_btn {background: url("../resources/img/common/bg_btn01_m_red.a7587241.png") no-repeat;}
    .register_btn {background: url("../resources/img/common/bg_btn01_m.f1fea850.png") no-repeat; color: #fff;}
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">  
	$(document).ready(function() {
		var msg = "${param.msg}";
		<%
		MemberVO member = (MemberVO) session.getAttribute("member");
		if(member != null) {
		%>
			alert("이미 로그인 되어있습니다.");
	   		window.history.back();
		<% } %>
		$(".login_btn").on("click", function() {
			if($("#userId").val()=="" || $("#userId").val() == null ){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPwd").val()=="" || $("#userPwd").val()== null ){
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return false;
			}
			if($("#userId").val()!="" && $("#userPwd").val()) {
				$(".loginForm").submit()
			}
		});
		
		
		$(".register_btn").on("click", function() {
			location.href = "${contextPath}/member/registerView.do";
		});
		
		// 엔터키 이벤트
		$("input[name=userId],input[name=userPwd]").on("keydown", function(key){
			if(key.keyCode == 13) {
				$(".login_btn").click();
			}
		});
		
		if(msg == "error") {
			alert("로그인 실패!\n아이디와 비밀번호를 확인해주세요.");
		}
				
	});

Kakao.init('8f702394e8d8aa9f3867f0a2979ae251');

function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response);
        	 $.ajax({
        		  type:"POST",
        		  url:"./kakaoLogin.json",
        		  data: {
        			  		id:response.id
        		  		},
        		  success: function(res) {
        			  $("#socialId").val(response.id);
        			  $("#userEmail").val(response.kakao_account.email);
        			  if(res.result == 0) {
        				  alert("회원가입 후 로그인 해주세요.");
        				  $("#social_form").attr("action", "./registerView.do");
        				  $("#social_form").submit();
        			  } else {
        				  if(res.code == 200) {
        					  location.href="../main.do";
        				  } else if(res.code == 501) {
        					  alert("유효하지 않은 정보입니다.");
        					  return
        				  }
        			  }
        		  }
        	  });
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
</script>
	<div id="content">
		<div class="site_locate">
			<div class="locate_box">
				<a href="/">Home</a>
				<span>로그인</span>
			</div>
		</div>
		<div class="con_wrap">
			<div class="login_con">
				<h2 class="login_tit">로그인</h2>
				<div class="login_box">
					<div class="welcome_box">
						<p>WHERE IS TASTE IS KING!</p>
						<p>어서오세요! 버거킹입니다.</p>
					</div>
					<div class="login_form_box">
						<form class="loginForm" method="post" action="${contextPath}/member/login.do">
							<div>
								<label for="userId"></label>
								<input type="text" id="userId" name="userId" placeholder="아이디">
							</div>
							<div>
								<label for="userPwd"></label> 
								<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
							</div>
							<div class="login_btn_box">
								<button class="login_btn" type="button">로그인</button>
								<button class="register_btn" type="button">회원가입</button>
								<button id="kakaoLogin_btn" type="button" onclick="kakaoLogin();">카카오 로그인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<form id="social_form" method="POST">
	<input type="hidden" name="socialId" id="socialId" value="" />
	<input type="hidden" name="email" id="userEmail" value="" />
</form>
