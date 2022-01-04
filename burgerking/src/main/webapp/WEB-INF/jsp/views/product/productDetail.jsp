<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; min-height: 488px;}
.content_box {width: 100%; height: 100%; }
.product_box {width: 100%; height: 400px; background-color: #000;}
.product_bg {width: 1440px; height: 400px; margin: 0 auto; background:url("${contextPath}/resources/img/menu_detail/bg_prd_detailintro.4e4e1753.png") no-repeat;}
.product_intro {max-width: 1144px; height: 400px; padding: 0 20px; margin: 0 auto; position: relative;}
.img_box {position: absolute; right: 0; bottom: 10%;}
.product_name {color:#fff; font-size:50px; margin: 0; padding-top: 10%;}
.product_description { margin: 60px 0; font-size: 20px; color: #FFFFFF;}
.product_btn_box {width: 100%; height: 88px; background:url("${contextPath}/resources/img/menu_detail/bg_menu_subinfoWrap.23f3cf83.png");}
.product_btn_box div {max-width: 1144px; padding: 0 20px; margin: 0 auto; line-height: 88px;}
.product_btn {color:#fff; font-size:24px; font-weight: bold; border: 0; background: transparent; cursor:pointer;}
</style>
<script>
	$(document).ready(function(){
		$(".product_btn").on("click", function(){
			window.history.back();
		});
		$(".addCart_btn").on("click", function(){
			$(".product_add_form").submit();
		});
	});
</script>
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
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="/main.do">Home</a>
                    <a href="productList.do?cate=${product.pCategory }">메뉴소개</a>
                    <a href="productList.do?cate=${product.pCategory }"><%=cate_tit %></a>
                    <span>${product.pName}</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="product_box">
                    	<div class="product_bg">
	                    	<div class="product_intro">
	                    		<div class="img_box">
	                    			<img src="${contextPath}/resources/${product.pUrl}" alt="${product.pName}사진" />
	                    		</div>
	                    		<h2 class="product_name">${product.pName}</h2>
	                    		<p class="product_description">${product.pDescription}</p>
	                    	</div>               
                    	</div>
                    	<div class="product_btn_box">
                    		<div>
                    			<button class="product_btn" type="button">← 메뉴 목록으로 돌아가기 </button>
                    		</div>
                   		</div>
                    </div>
                </div>
            </div>
        </div>

