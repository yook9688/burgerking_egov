<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.CartVO"  %>
<%@ page import="java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>   
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {overflow:hidden; width: 100%; height: auto; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px; margin: 0 20px;}
.subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
.list_box {float: left; width: 1144px; height: 100%; padding: 0 0 30px 0;}
.cart_list {float: left; width: 100%; margin: 20px auto; border-bottom: 1px solid #999; position: relative;}
.product_box {width: 100%; height: 100%; }
.product_desc_box {float: left; width: 700px; height: 100%;}
.product_desc_box > div {margin-left: 50px;}
.product_desc_box p {font-size:20px;}
.orderId {font-size:30px; font-weight: bold; }
.orderId a {color:#e22219;}
.order_box {float: left; width: 100%;}
.totalPrice {font-size: 30px; line-height: 3;}
.productList_btn {display:inline-block; width: 200px; height: 60px; float: right; margin-right: 20px; margin-top: 15px; font-size: 27px; border: 0; cursor: pointer; background:url("../resources/img/common/bg_btn01_m.f1fea850.png") no-repeat; color: #fff;}
.no_data_box {width: 100%; height: 400px; background:url("../resources/img/common/no_data.png") no-repeat center;}
.no_data_box p {font-size: 30px; text-align: center; padding: 200px 0 0 0; margin: 0;}
</style>
<script>
$(document).ready(function(){	
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
                        <p>주문목록</p>
                    </div>
                    <ul class="list_box">
                    	<c:if test="${fn:length(orderList) == 0}">
                    		<div class="no_data_box">
	                   			<p>주문목록이 없습니다.</p>
	                   		</div>
                    	</c:if>
                    	<c:forEach items="${orderList}" var="list">
                        <li class="cart_list">
                        	<div class="orderList_box">
                                <div class="product_desc_box">
                            		<div class="orderId">
	                                	<a href="../order/orderDetail.do?oId=${list.orderId}"> 주문번호 : ${list.orderId}</a>
	                                </div>
	                                <div>
	                                	<p>배달주소 : ${list.userAddress} ${list.userDetailAddress} ${list.userExtraAddress}</p>
	                                	<p>주문일 : ${list.orderDate}</p>
	                                </div>
                           		</div>
							</div>
                        </li>
                    	</c:forEach>
                    	<li class="order_box">
         					<button type="button" class="productList_btn">메뉴 목록으로</button>
						</li>	
                    </ul>
                </div>
            </div>
        </div>

