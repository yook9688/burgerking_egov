<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.delete_con {max-width: 1144px; height: 500px; padding: 0 20px; margin: 40px auto; }
.delete_tit {text-align: center; font-size: 30px;}
.delete_form {width: 600px; margin: 0 auto;}
.delete_form div {margin: 40px 0;}
.delete_form div:last-child {margin-top: 50px;}
.delete_form label {display: inline-block; width: 150px; height: 30px; font-size: 25px;}
.delete_form input {width: 400px; height: 30px; margin-left: 20px; font-size: 25px;}
.delete_btn_box {width: 600px; height: 60px; margin: 0 auto; text-align: center; margin-top: 50px;}
.delete_btn_box button {width: 250px; height: 50px; text-align: center; border-radius: 8px; border: 2px solid #000;  font-size: 20px}
.delete_btn {margin-right: 50px; background: #000; color: #fff;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cancel_btn").on("click", function(){
			
			location.href = "./loginView.do";
					    
		});
		
		$(".delete_btn").on("click", function(){
			if($("#userPwd").val()=="" || $("#userPwd").val()== null ){
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return false;
			}
			$.ajax({
				url : "./pwdCheck.json",
				type : "POST",
				dataType : "json",
				data : $(".delete_form").serializeArray(),
				success : function(data){
					
					if(data == 0) {
						alert("비밀번호가 틀립니다.")
						return;
					} else {
						if(confirm("정말 탈퇴하시겠습니까?")) {
							alert("그 동안 이용해주셔서 감사합니다!");
							$(".delete_form").submit();
						} 
					}
				}
			});
		});
	});
</script>
		<div id="content">
			<div class="site_locate">
				<div class="locate_box">
					<a href="/">Home</a>
					<span>회원탈퇴</span>
				</div>
			</div>
			<div class="con_wrap">
				<div class="delete_con">
					<h2 class="delete_tit">회원탈퇴</h2>
					<form class="delete_form" action="./delete.do" method="post" >
						<div>
							<label for="userId">아이디</label>
							<input class="delete_input" type="text" id="userId" name="userId" value="${member.userId}" readonly />
						</div>
						<div>
							<label for="userPass">패스워드</label>
							<input class="delete_input" type="password" id="userPwd" name="userPwd" />
						</div>
						<div class="delete_btn_box">
							<button class="delete_btn" type="button">회원탈퇴</button>
							<button class="cancel_btn" type="button">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
