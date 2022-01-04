<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<div id="sitemap">
            <div class="sitemap_wrap">
                <div class="sitemap_con_wrap">
                    <ul class="sitemap">
                        <li>
                            <a href="${contextPath}/product/productList.do?cate=ss">메뉴</a>
                            <ul class="sitemap_sub">
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
                            <a href="${contextPath}/searchStore.do">매장</a>
                            <ul class="sitemap_sub">
                                <li><a href="${contextPath}/searchStore.do">매장찾기</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">이벤트</a>
                            <ul class="sitemap_sub">
                                <li><a href="javascript:void(0)">이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${contextPath}/why.do">브랜드 스토리</a>
                            <ul class="sitemap_sub">
                                <li><a href="${contextPath}/story.do">버거킹 스토리</a></li>
                                <li><a href="${contextPath}/why.do">WHY 버거킹</a></li>
                                <li><a href="javascript:void(0)">버거킹 News</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${contextPath}/board/list.do">고객센터</a>
                            <ul class="sitemap_sub">
                                <li><a href="${contextPath}/board/list.do">공지사항</a></li>
                                <li><a href="javascript:void(0)">버거킹앱이용안내</a></li>
                                <li><a href="javascript:void(0)">FAQ</a></li>
                                <li><a href="javascript:void(0)">문의</a></li>
                                <li><a href="javascript:void(0)">가맹점모집</a></li>
                                <li><a href="javascript:void(0)">인재채용</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>  
        </div>