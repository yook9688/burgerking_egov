<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.CartVO"  %>
<%@ page import="java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>   
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {overflow:hidden; width: 100%; height: auto; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px; margin: 0 20px;}
.subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
.list_box {float: left; width: 1144px; height: 100%; padding: 0 0 30px 0;}
.order_list {float: left; width: 100%; margin: 20px auto; border-bottom: 1px solid #999;}
.product_box {width: 100%; height: 100%; }
.img_box {float:left; width: 350px;}
.img_box img {width: 100%; height: 100%;} 
.product_desc_box {float: left; width: 700px; height: 100%;}
.product_desc_box > div {width: 600px; margin-left: 50px;}
.p_name {min-width: 115px; text-align: center; font-weight: bold;}
.p_name p {font-size: 25px; margin: 0;}
.option_box p,.price_box p {font-size: 20px;}
.order_box {float: left; width: 100%;}
.totalPrice {font-size: 30px; line-height: 3;}
.listBack_btn {display:inline-block; width: 200px; height: 60px; float: right; margin-right: 20px; margin-top: 15px; font-size: 27px; border: 0; cursor: pointer;}
.listBack_btn {background:url("../resources/img/common/bg_btn01_m.f1fea850.png") no-repeat; color: #fff;}
</style>
<script>
$(document).ready(function(){
	$(".delete_btn").on("click", function(){
		$(".delete_form").submit();
		
	});
	
	$(".listBack_btn").on("click",function(){
		location.href="../order/orderList.do";
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
                        <p>주문 상세보기</p>
                    </div>
                    <ul class="list_box">
                    	<c:set var="sum" value="0" />
                    	<c:forEach items="${orderDetailList}" var="list">
                        <li class="order_list">
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
											<c:when test="${list.side2 == null}">
											<p>사이드 : ${list.side1}</p>
											<p>음료 : ${list.drink1}</p>
											</c:when>
											<c:when test="${list.side2 != null}">
											<p>사이드1 : ${list.side1}</p>
											<p>사이드2 : ${list.side2}</p>
											<p>음료1 : ${list.drink1}</p>
											<p>음료2 : ${list.drink2}</p>
											</c:when>												
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
                    	<li>
                    		<%-- <div class="requests_box">
                    			<p>요청사항 : ${orderDetailList.requests} </p>
                    		</div> --%>
                    	</li>
                    	<li class="order_box">
                   			<span class="totalPrice">총 주문 금액 : ${sum}원</span>
         					<button type="button" class="listBack_btn">주문목록으로</button>
						</li>	
                    </ul>
                </div>
            </div>
        </div>

