<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.CartVO"  %>
<%@ page import="java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>   
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {overflow:hidden; width: 100%; height: auto; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px; margin: 0 20px;}
.subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
.premenu {float: left; width: 1144px; height: 100%; padding: 0 0 30px 0;}
.cart_list {float: left; width: 100%; margin: 20px auto; border-bottom: 1px solid #999; position: relative;}
.product_box {width: 100%; height: 100%; }
.img_box {float:left; width: 350px;}
.img_box img {width: 100%; height: 100%;} 
.product_desc_box {float: left; width: 700px; height: 100%;}
.product_desc_box > div {width: 600px; margin-left: 50px;}
.p_name {min-width: 115px; text-align: center; font-weight: bold;}
.p_name p {font-size: 25px; margin: 0;}
.option_box p,.price_box p {font-size: 20px;}
.delete_btn {position: absolute; bottom: 20px; right: 20px; width: 60px; height: 30px;}
.order_box {float: left; width: 100%;}
.totalPrice {font-size: 30px; line-height: 3;}
.productList_btn,.order_btn {display:inline-block; width: 200px; height: 60px; float: right; margin-right: 20px; margin-top: 15px; font-size: 27px; border: 0; cursor: pointer;}
.productList_btn {background:url("../resources/img/common/bg_btn01_m.f1fea850.png") no-repeat; color: #fff;}
.order_btn {background:url("../resources/img/common/bg_btn01_m_red.a7587241.png") no-repeat; color: #fff;}
.no_data_box {width: 100%; height: 400px; background:url("../resources/img/common/no_data.png") no-repeat center;}
.no_data_box p {font-size: 30px; text-align: center; padding: 200px 0 0 0; margin: 0;}
</style>
<script>
$(document).ready(function(){
	$(".delete_btn").on("click", function(){
		$(this).prev("form").submit();
		
	});
	
	$(".order_btn").on("click", function(){
		location.href="../order/orderView.do";
	});
	
	$(".productList_btn").on("click",function(){
		location.href="../cart/productList.do?cate=ss";
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
                        <p>장바구니</p>
                    </div>
                    <ul class= "premenu">
                   	<c:set var="sum" value="0" />
                   	<c:if test="${fn:length(cartList) == 0}">
                   		<div class="no_data_box">
                   			<p>메뉴를 추가해주세요.</p>
                   		</div>
                   	</c:if>
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
							<c:when test="${list.pOption == '단품'}"></c:when>
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
                               			<p>가격 : ${list.price}원</p>
                               		</div>
                           		</div>
							</div>
                            <div class="btn_box">
                            	<form action="cartDelete.do" class="delete_form" method="POST">
                            		<input type="hidden" name="cartNum" id="cartNum" value="${list.cartNum}" />
                           		</form>
                           		<button type="button" class="delete_btn" >삭제</button>
                            </div>
                        </li>
                       	<c:set var="sum" value="${sum + list.price}" />
                    	</c:forEach>
                    	<li class="order_box">
                   			<span class="totalPrice">총 주문 금액 : ${sum}원</span>
         					<button type="button" class="order_btn">주문정보입력</button>
         					<button type="button" class="productList_btn">메뉴 추가</button>
						</li>	
                    </ul>
                </div>
            </div>
        </div>

