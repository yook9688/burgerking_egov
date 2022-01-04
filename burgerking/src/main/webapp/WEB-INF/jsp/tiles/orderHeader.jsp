<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.MemberVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0">
    <title>버거킹</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="../resources/js/slider.js"></script>
    <link rel="stylesheet" href="../resources/css/order_common.css">
</head>
<body>
	<div id="wrap">
        <div id="hd">
            <div class="hd_wrap">
            	<nav class="tnb">
			        <ul>
				        <% 
							MemberVO member =  (MemberVO) session.getAttribute("member");				        
				        	if(member == null) {
				        %>
				        <li>
							<a href="${contextPath}/member/loginView.do">로그인</a>
						</li>
						<li>
							<a href="${contextPath}/member/registerView.do">회원가입</a>
						</li>
						<%
				        	} else {	
						%>
						<li>
							<a href="${contextPath}/member/updateView.do">회원정보수정</a>
						</li>
						<li>
							<a href="${contextPath}/member/logout.do">로그아웃</a>
						</li>
						<%
				        	}
						%>
						<li><a href="${contextPath}/main.do">브랜드홈으로</a></li>
			        </ul>
	        	</nav>
                <a href="../cart/productList.do?cate=ss" class="logo"><img src="../resources/img/main/logo_header.gif" alt="로고"></a>
               	<h2 class="tit">딜리버리</h2>
                <button class="cart_btn">
                    <span>장바구니</span>
                </button>
                <button class="orderList_btn">
                    <span>주문목록</span>
                </button>
                <script>
                	$(function(){
                		$(".cart_btn").click(function(){
                			location.href = "../cart/cartList.do"
                		});
                		$(".orderList_btn").click(function(){
                			location.href = "../order/orderList.do"
                		});
                	});
                </script>
            </div>
        </div>
	</div>