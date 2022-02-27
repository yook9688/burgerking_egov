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
    <script src="${contextPath}/resources/js/slider.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<body>
	<div id="wrap">
        <div id="hd">
            <div class="hd_wrap">
            	<nav class="tnb">
			        <ul>
				        <c:choose>
				        	<c:when test="${empty sessionScope.member}">
						        <li>
									<a href="${contextPath}/member/loginView.do">로그인</a>
								</li>
								<li>
									<a href="${contextPath}/member/registerView.do">회원가입</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${contextPath}/member/updateView.do">회원정보수정</a>
								</li>
								<li>
									<a href="${contextPath}/logout.do">로그아웃</a>
								</li>
							</c:otherwise>
						</c:choose>
						<li><a href="${contextPath}/main.do">홈으로</a></li>
			        </ul>
	        	</nav>
                <a href="${contextPath}/main.do" class="logo"><img src="${contextPath}/resources/img/main/logo_header.gif" alt="로고"></a>
                <nav class="gnb">
                    <ul class="main">
                        <li>
                            <span>메뉴소개</span>
                            <img src="${contextPath}/resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="${contextPath}/product/productList.do?cate=ss">스페셜&할인팩</a></li>
                                <li><a href="${contextPath}/product/productList.do?cate=p">프리미엄</a></li>
                                <li><a href="${contextPath}/product/productList.do?cate=w">와퍼</a></li>
                                <li><a href="${contextPath}/product/productList.do?cate=jb">주니어&버거</a></li>
                                <li><a href="${contextPath}/product/productList.do?cate=a">올데이킹&치킨버거</a></li>
                   	            <li><a href="${contextPath}/product/productList.do?cate=s">사이드</a></li>
                                <li><a href="${contextPath}/product/productList.do?cate=d">음료&디저트</a></li>
                                <li><a href="${contextPath}/product/productList.do?cate=m">아침메뉴</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>매장소개</span>
                            <img src="${contextPath}/resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="${contextPath}/searchStore.do">매장찾기</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>이벤트</span>
                            <img src="${contextPath}/resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="javascript:void(0)">이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>브랜드스토리</span>
                            <img src="${contextPath}/resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="${contextPath}/story.do">버거킹 스토리</a></li>
                                <li><a href="${contextPath}/why.do">WHY 버거킹</a></li>
                                <li><a href="javascript:void(0)">버거킹 NEWS</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <button class="dil_btn">
                    <span>딜리버리주문</span>
                </button>
                 <script>
                	$(function(){
                		$(".dil_btn").click(function(){
                			location.href = "${contextPath}/cart/productList.do?cate=ss"
                		});
                	});
                 </script>	
            </div>
        </div>
	</div>