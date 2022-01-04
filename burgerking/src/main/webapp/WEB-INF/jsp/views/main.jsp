<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
   	<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
        <div id="content">
            <div class="con_wrap">
                <div class="sec1 sec">
                    <div class="ban_sec">
                        <div class="ban">
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너1.png" alt="배너1" data-val="1"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너2.png" alt="배너2" data-val="2"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너3.png" alt="배너3" data-val="3"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너4.png" alt="배너4" data-val="4"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너5.png" alt="배너5" data-val="5"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너6.png" alt="배너6" data-val="6"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너7.png" alt="배너7" data-val="7"></a>
                            <a href="javascript:void(0)"><img src="${contextPath}/resources/img/main/배너8.png" alt="배너8" data-val="8"></a>  
                        </div>
                        <div class="btn_box">
                            <img class="leftbtn" src="${contextPath}/resources/img/main/ban_leftbtn.png" alt="배너왼쪽버튼"> 
                            <img class="rightbtn" src="${contextPath}/resources/img/main/ban_rightbtn.png" alt="배너오른쪽버튼">
                        </div>
                        <div id="num_box">
                            <button class="btn on" id="btn1"></button>
                            <button class="btn" id="btn2"></button>
                            <button class="btn" id="btn3"></button>
                            <button class="btn" id="btn4"></button>
                            <button class="btn" id="btn5"></button>
                            <button class="btn" id="btn6"></button>
                            <button class="btn" id="btn7"></button>
                            <button class="btn" id="btn8"></button>
                        </div>
                    </div>
                </div>
                <div class="sec2 sec">
                    <div class="sec2_wrap">
                    <iframe width="1440" height="610" src="https://www.youtube.com/embed/CE2LzK53XMY" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="sec3 sec">
                    <div class="sec3_wrap">
                        <ul class="snslist">
                            <li class=logo_you>
                                <div class="sns_con">
                                    <a href="https://www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA/featured" target="_blank">
                                        <p>YOUTUBE</p>
                                        <span class=youtube>구독2.3만</span>
                                    </a>
                                </div>
                            </li>
                            <li class="logo_face">
                                <div class="sns_con">
                                    <a href="https://www.facebook.com/burgerkingkorea" target="_blank">
                                        <p>FACEBOOK</p>
                                        <span class=facebook>좋아요 51.8만</span>
                                    </a>
                                </div>
                            </li>
                            <li class=logo_insta>
                                <div class="sns_con">
                                    <a href="https://www.instagram.com/burgerkingkorea/" target="_blank">
                                        <p>INSTAGRAM</p>
                                        <span class=instagram>팔로워 413.0K</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="sec4 sec">
                    <div class="sec4_wrap">
                        <div class="app_direc">
                            <a href="javascript:void(0)"></a>
                        </div>
                        <div class="dil_direc">
                            <a href="javascript:void(0)"></a>
                        </div>
                    </div>
                </div>
                <div class="sec5 sec">
                    <div class="sec5_wrap">
                        <h2>매장찾기</h2>
                        <p>고객님 주변에 있는 버거킹을 찾아보세요!</p>
                        <div class="searchshop_btn">
                            <a href="searchStore.do"><p>매장찾기</p></a>
                        </div>
                        <ul class="shop_catelist">
                            <li>
                                <img src="${contextPath}/resources/img/main/cate1.gif" alt="딜리버리아이콘">
                                <span>집에서 편안하게
                                    <br>
                                    받을 수 있는
                                    <br>
                                </span>
                                <p>딜리버리</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/img/main/cate2.gif" alt="킹오더아이콘">
                                <span>미리 주문하고
                                    <br>
                                    픽업가능한
                                    <br>
                                </span>
                                <p>킹오더</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/img/main/cate3.gif" alt="드라이브스루아이콘">
                                <span>차안에서 빠르게
                                    <br>
                                    이용할 수 있는
                                    <br>
                                </span>
                                <p>드라이브 스루</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/img/main/cate4.gif" alt="24시간아이콘">
                                <span>24시간 언제든
                                    <br>
                                    함께할 수 있는
                                    <br>
                                </span>
                                <p>24시간</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/img/main/cate5.gif" alt="아침메뉴아이콘">
                                <span>든든한
                                    <br>
                                    아침을 도와줄
                                    <br>
                                </span>
                                <p>아침메뉴</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/img/main/cate6.gif" alt="주차공간아이콘">
                                <span>내 차와 함께
                                    <br>
                                    올 수 있는
                                    <br>
                                </span>
                                <p>주차공간</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="sec6 sec">
                    <div class="sec6_wrap">
                        <div class="sec6_con">
                            <h2>집에서 만나는 버거킹</h2>
                            <p>딜리버리 전화주문 안내 10:00-22:00 / 연중무휴 (매장별로 상이할 수 있습니다.)</p>
                            <span>1599-0505</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>