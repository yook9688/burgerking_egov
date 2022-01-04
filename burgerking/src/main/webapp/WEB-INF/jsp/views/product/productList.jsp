<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.araise.burgerking.vo.MemberVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>   
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px; margin: 0 20px;}
.subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
.subtit_wrap ul {float: right; width: auto; margin-top: 10px;}
.subtit_wrap ul li {float: left; width: fit-content; margin: 0  15px;}
.subtit_wrap ul li a {font-size: 18px; color: #2e2e2e; }
.premenu_cate_box {font-size: 20px; text-align: center;}
.premenu_list_box {clear: both; width: 100%; height: 100%;}
.premenu {float: left; max-width: 1144px;  padding: 0 0 30px 0;}
.col4 {max-width: 276px; width: 276px; height: 259px; }
.menu_list {float: left; margin: 0 5px; margin-top: 30px;}
.menu_list button {width: 276px; height: 259px; color: #000; border: 0; background: none; cursor:pointer;}
.img_box {max-width: 220px; height: 144px; margin: 0 auto; }
.img_box img {width: 100%; height: 100%;} 
.img_name {min-width: 115px; padding: 30px 5px 0; font-size: 20px; text-align: center; font-weight: bold;}
</style>
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="index.html">Home</a>
                    <span>메뉴소개</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="subtit_wrap">
                        <p>메뉴소개</p>
                        <ul>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=ss" >스페셜&#38;할인팩</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=p" >프리미엄</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=w" >와퍼</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=jb" >주니어&#38;버거</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=a" >올데이킹&#38;치킨버거</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=s" >사이드</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=d" >음료&#38;디저트</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="productList.do?cate=m" >아침메뉴</a></li>
                        </ul>
                    </div>
                    <%
                    request.setCharacterEncoding("utf-8");
					String cate = request.getParameter("cate");
					String cate_tit= "";
					switch(cate) {
					case "ss" : 
						cate_tit = "스페셜&할인팩";
						break;
					case "p" : 
						cate_tit = "프리미엄";
						break;
					case "w" : 
						cate_tit = "와퍼";
						break;
					case "jb" : 
						cate_tit = "주니어&버거";
						break;
					case "a" : 
						cate_tit = "올데이킹&치킨버거";
						break;
					case "s" : 
						cate_tit = "사이드";
						break;
					case "d" : 
						cate_tit = "음료&디저트";
						break;
					case "m" : 
						cate_tit = "아침메뉴";
						break;
					}	
					%>
					<div class="premenu_cate_box">
						<h2><%=cate_tit %></h2>
					</div>
                    <div class="premenu_list_box">
                        <ul class="premenu">
                        	<c:forEach items="${product}" var="product">
	                            <li class="menu_list col4">
	                                <button onclick="location.href='productDetail.do?cate=${product.pCategory}&c=${product.pCode}'">
	                                    <div class="img_box">
	                                    	<img src="${contextPath}/resources/${product.pUrl}" alt="${product.pName}"/>
	                                    </div>
	                                    <div class="img_name">
	                                        <p>${product.pName}</p>
	                                    </div>
	                                </button>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

