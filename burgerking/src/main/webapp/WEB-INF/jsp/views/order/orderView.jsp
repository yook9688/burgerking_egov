<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.MemberVO"  %>
<%@ page import="com.araise.burgerking.vo.CartVO"  %>
<%@ page import="java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>   
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {overflow:hidden; width: 100%; height: auto; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: auto; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px;}
.subtit {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }

.order_info_box {width: 100%; height: 100%; border-bottom: 2px solid #000;}
.con_tit {font-size:25px;}
.order_form div {width: 100%; margin: 20px 0;}
.order_form label {display: inline-block; width: 200px; height: 60px; font-size: 25px;}
.order_form input {width: 400px; height: 60px; font-size: 25px;}
.order_form div:last-child input {width: 850px; height: 60px; font-size: 25px;}

.premenu_list_box {clear: both; width: 100%; height: auto;}
.premenu {float: left; width: 1144px; border-bottom: 2px solid #000;}
.cart_list {float: left; width: 100%; height: 100%; margin: 20px auto; border-bottom: 1px solid #999; position: relative;}
.cart_list:last-child {margin-bottom: 0;}
.product_box {width: 100%; height: 100%; }
.img_box {float:left; width: 350px;}
.img_box img {width: 100%; height: 100%;} 
.product_desc_box {float: left; width: 700px; height: 100%;}
.product_desc_box > div {width: 600px; margin-left: 50px;}
.p_name {min-width: 115px; text-align: center; font-weight: bold;}
.p_name p {font-size: 25px; margin: 0;}
.option_box p,.price_box p {font-size: 20px;}
.order_box {width: 100%;}
.totalPrice {font-size: 30px; line-height: 3;}
.payment_btn,.cancel_btn {display:inline-block; width: 200px; height: 60px; float: right; margin-right: 20px; margin-top: 15px; font-size: 30px; border: 0; cursor: pointer;}
.cancel_btn {background:url("../resources/img/common/bg_btn01_m.f1fea850.png") no-repeat; color: #fff;}
.payment_btn {background:url("../resources/img/common/bg_btn01_m_red.a7587241.png") no-repeat; color: #fff;}
</style>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	String email = member.getUserEmail();
	String name = member.getUserName();
	String phone = member.getUserPhone();
	String address = member.getUserAddress()+" "+member.getUserDetailAddress()+" "+member.getUserExtraAddress();

%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function(){
	
	var IMP = window.IMP; // 생략가능
    IMP.init('imp41962934'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
    var price = $(".totalPrice_value").val();
    var msg;
    
	$(".payment_btn").on("click", function(){
		IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '버거킹 주문 결제',
            amount : price,
            buyer_email : '${member.userEmail}',
            buyer_name : '${member.userName}',
            buyer_tel : '${member.userPhone}',
            buyer_addr : '${member.userAddress}',
            /* buyer_postcode : '123-456', */
            /* m_redirect_url : 'http://www.naver.com' */
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                alert("결제가 완료되었습니다. 이용해 주셔서 감사합니다!");
                $(".order_form").submit();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
        
    });	
	
	$(".cancel_btn").on("click", function(){
		history.back();
	});
	
});
</script>
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="/">Home</a>
                    <span>딜리버리</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="subtit_wrap">
                        <p class="subtit">주문하기</p>
                    </div>
                    <div class="order_info_box">
                    	<div class="con_tit_box">
                   			<p class="con_tit">배달정보</p>
                   		</div>
                   		<form action="../order/order.do" class="order_form" method="post">
                   			<div>
                    			<label for="userAddress">주소</label>
                    			<input type="text" name="userAddress" id="userAddress" value="${member.userAddress}" readonly onclick="execDaumPostcode()" />
                   			</div>
                   			<div>
                   				<label for="userDetailAddress">상세주소</label>
                   				<input type="text" name="userDetailAddress" id="userDetailAddress" value="${member.userDetailAddress}" />
                    			<input type="text" name="userExtraAddress" id="userExtraAddress" value="${member.userExtraAddress}" readonly/>
                   			</div>
                   			<div>	
                    			<label for="userPhone">연락처</label>
                    			<input type="text" name="userPhone" id="userPhone" value="${member.userPhone}" />
                   			</div>
                   			<div>
                   				<label for="requests">요청사항</label>
                   				<input type="text" name="requests" id="requests" maxlength="50" placeholder="최대 50자까지 작성 가능"/>
                   			</div>
                   		</form>
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
						                document.getElementById("userDetailAddress").value = '';
						                document.getElementById("userDetailAddress").focus();
						            }
						        }).open();
						    }
						</script>
                   	</div>
                    <div class="premenu_list_box">
                    	<p class="con_tit">주문정보</p>
                        <ul class= "premenu">
                        	<c:set var="sum" value="0" />
                        	<c:forEach items="${cartList}" var="list">
                            <li class="cart_list">
                            	<div class="product_box">
                                    <div class="img_box">
                                    	<img src="../resources/${list.pUrl}" alt="${list.pName}" />
                                    </div>
                                    <div class="product_desc_box">
	                                    <div class="p_name">
	                                        <p>${list.pName}</p>
	                                    </div>
	                                    <div class="option_box">
										<c:choose>
											<c:when test="${list.pOption == '단품'}"/>
											<c:when test="${list.pOption == '할인팩'}">
												<p>사이드1 : ${list.side1}</p>
												<p>사이드2 : ${list.side2}</p>
												<p>음료1 : ${list.drink1}</p>
												<p>음료2 : ${list.drink2}</p>
											</c:when>
											<c:otherwise>
												<p>사이드 : ${list.side1}</p>
												<p>음료 : ${list.drink1}</p>
											</c:otherwise>												
										</c:choose> 
                                    	</div>
                                    	<div class="price_box">
                                   			<p>가격 : ${list.price}</p>
                                   		</div>
                               		</div>
								</div>
                            </li>
                           	<c:set var="sum" value="${sum + list.price}" />
                        	</c:forEach>
                        </ul>
					</div>
					<div class="order_box">
						<span class="totalPrice">총 주문 금액 : ${sum}원</span>
						<input type="hidden" class="totalPrice_value" value="${sum}" />
       					<button type="button" class="payment_btn">결제하기</button>
       					<button type="button" class="cancel_btn">취소</button>
					</div>
                </div>
            </div>
        </div>

