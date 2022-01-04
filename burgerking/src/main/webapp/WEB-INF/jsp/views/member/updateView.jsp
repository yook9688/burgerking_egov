<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.con_tit {width: 600px; text-align: center; font-size: 30px; margin: 0 auto; margin-bottom: 50px;}
.con_box {width: 600px; margin: 0 auto;}
.update_form {width: 600px; height: 600px; margin: 0 auto;}
.update_form div {margin: 20px 0;}
.update_form div:last-child {margin-top: 50px;}
.update_form div label {display: inline-block; font-size: 20px; width: 150px; margin-left: 50px;}
.update_input {width: 300px; height: 30px; font-size: 20px;}
.update_detailAddress {width: 200px; height: 30px; font-size: 20px;}
.update_extraAddress {width: 150px; height: 30px; font-size: 20px; margin-left: 10px;}
.update_btn_box button { display: inline-block; width: 180px; height: 50px; margin: 20px 0px; border: 2px solid #000; font-size: 20px; cursor: pointer; border-radius: 8px; box-sizing: border-box; margin-left: 10px; }
.submit_btn {background: #e22219;}
.delete_btn {background: #000000; color:#fff;}
</style>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel_btn").on("click", function(){
				
				window.history.back();
						    
			});
			
			$(".delete_btn").on("click", function(){
				
				location.href = "./deleteView.do";
				
			});
			
			$(".submit_btn").on("click", function(){
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
				if($("#userName").val()=="" || $("#userName").val()== null){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userBirth").val()=="" || $("#userBirth").val()== null){
					alert("생년월일을 입력해주세요.");
					$("#userBirth").focus();
					return false;
				}
				if($("#userEmail").val()=="" || $("#userEmail").val()== null){
					alert("이메일을 입력해주세요.");
					$("#usermail").focus();
					return false;
				}
				if($("#userAddress").val()=="" || $("#userAddress").val()== null){
					alert("주소를 입력해주세요.");
					$("#userAddress").focus();
					return false;
				}
				if($("#userPhone").val()=="" || $("#userPhone").val()== null){
					alert("연락처를 입력해주세요.");
					$("#userPhone").focus();
					return false;
				}
				if($("#userId").val()!="" && $("#userPwd").val()!="" && $("#userName").val()!="" && $("#userBirth").val()!="" && $("#userEmail").val()!="" && $("#userAddress").val()!="" && $("#userPhone").val()!="") {
					alert("회원정보 수정이 완료되었습니다!")
					$(".update_form").submit()
				}
				
			});
			
				
			
		})
	</script>
		<div id="content">
			<div class="site_locate">
				<div class="locate_box">
					<a href="/">Home</a>
					<a href="../member/loginView">로그인</a>
					<span>회원정보수정</span>
				</div>
			</div>
			<div class="con_wrap">
				<h2 class="con_tit">회원정보수정</h2>
				<div class="con_box">
					<form class="update_form" action="./update.do" method="post">
						<div>
							<label for="userId">아이디</label>
							<input class="update_input" type="text" id="userId" name="userId" value="${memberInfo.userId}" readonly />
						</div>
						<div>
							<label for="userPass">패스워드</label>
							<input class="update_input" type="password" id="userPwd" name="userPwd" />
						</div>
						<div>
							<label for="userName">성명</label>
							<input class="update_input" type="text" id="userName" name="userName" value="${memberInfo.userName}" />
						</div>
						<div>
							<label for="userBirth">생년월일</label>
							<input class="update_input" type="date" id="userBirth" name="userBirth" value="${memberInfo.userBirth}" />
						</div>
						<div>
							<label for="userEmail">이메일</label>
							<input class="update_input" type="email" id="userEmail" name="userEmail" value="${memberInfo.userEmail}" />
						</div>
						<div>
							<label for="userAddress">주소</label> 
							<input class="update_input" type="text" id="userAddress" name="userAddress" value="${memberInfo.userAddress}" readonly onclick="execDaumPostcode();" />
						</div>
						<div>
							<label for="userdetailAddress">상세주소</label> 
							<input class="update_detailAddress" type="text" id="userDetailAddress" name="userDetailAddress" value="${memberInfo.userDetailAddress}" />
							<input class="update_extraAddress" type="text" id="userExtraAddress" name="userExtraAddress" value="${memberInfo.userExtraAddress}" readonly />
						</div>
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						    function execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("userExtraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("userExtraAddress").value = '';
						                }
						
						                /* // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById("postcode").value = data.zonecode; */
						                document.getElementById("userAddress").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("userDetailAddress").focus();
						            }
						        }).open();
						    }
						</script>
						<div>
							<label for="userPhone">핸드폰</label>
							<input class="update_input" type="text" id="userPhone" name="userPhone" value="${memberInfo.userPhone }" />
						</div>
						<div class="update_btn_box">
							<button type="button" class="submit_btn">회원정보수정</button>
							<button type="button" class="delete_btn">회원탈퇴</button>
							<button type="button" class="cancel_btn">이전으로</button>
						</div>
					</form>
				</div>
			</div>
		</div>
