<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script src="resources/js/story_btn.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/story_common.css" />
<style>
/* 버튼 */
.con_btn_box {max-width: 1144px; height: 70px; padding: 0;}
.con_btn_box li {float: left; width: 50%; }
.con_btn_box li input {display: none;}
.con_btn_box li label {display: inline-block; border: 0; width: 100%; font-size: 23px; padding: 23px 0; font-weight: bold;
 border-bottom: 2px solid #000; color: silver; background-color: #f2f2f2; text-align: center; box-sizing: border-box; cursor: pointer;}
.con_btn_box li input:checked + label {color: #000; border: 2px solid #000; border-bottom: 0; background-color: #fff;}
.show {display: block;}
.hide {display: none;}

.story_box1 {max-width: 1144px; height: 100%; margin-top: 50px; padding-bottom: 60px;}
.about {width: 100%; height: 100%; margin: 20px 0px;}  
.about h3 {display: inline-block; width: 34%; font-size: 30px;}
.about p {display: inline-block; width: 66%; height: 100%; right: 0; float: right; font-size: 18px;}
.story_box2 {width: 1144px; height: 100%; margin-top: 100px; padding-bottom: 60px;}
.history {width: 100%; height: 100%; margin: 0 auto;}
.history_con {width: 100%; height: 100%; }
.his1, .his2, .his3 {position: relative;}
.history_con h4 {display: inline-block; width: 17%; font-size: 30px; font-weight: bold; line-height: 30px; vertical-align: top; margin: 20px 0; text-align: center;}
.history_con ul {display: inline-block; width: 45%; position: relative; margin: 0; padding-left: 40px; }
.history_con ul::before {display: block; content: ""; width: 1px; height: 100%; background: #000; position: absolute; left: 0; top: 0;}
.history_con ul li {width: 100%; line-height: 40px; position: relative; margin: 0;}
.history_con ul li p {font-size: 17px; }
.history_con ul li::before {display: block; content: ""; width: 9px; height: 9px; border-radius: 50%; background: #000; position: absolute; top: 25%; left: -44px;}
.history_con ul li:last-child {border-bottom: 1px solid #f2f2f2;}
.his1::after {display: block; content: ""; width: 558px; height: 360px; background: url(resources/img/stroy/img_history01.eacf28e5.png) no-repeat;  position: absolute; top: 20%; right: -20%;}
.his2::after {display: block; content: ""; width: 480px; height: 460px; background: url(resources/img/stroy/img_history02.fad0b3fe.png) no-repeat; position: absolute; top: -30%; right: -20%;}
.his3::after {display: block; content: ""; width: 745px; height: 295px; background: url(resources/img/stroy/img_history03.2e3fa65c.png) no-repeat; position: absolute; top: -20%; right: -30%;}
</style>
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href=".. /">Home</a>
                    <a href="../story">브랜드스토리</a>
                    <span>메뉴소개</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="subtit_wrap">
                        <p>브랜드 스토리</p>
                        <ul>
                            <li class="on"><a href="story.do">버거킹 스토리</a></li>
                            <li><a href="why.do">WHY 버거킹</a></li>
                            <li><a href="javascript:void(0)">버거킹 NEWS</a></li>
                        </ul>
                    </div> 
                    <ul class="con_btn_box">
                        <li>
                            <input type="radio" id="con_btn1" name="con_btn" checked>
                            <label for="con_btn1">ABOUT 버거킹</label>
                        </li>
                        <li>
                            <input type="radio" id="con_btn2" name="con_btn">
                            <label for="con_btn2">HISTORY</label>
                        </li>
                    </ul>
                    <div class="story_box1 box1 show">
                        <div class="about">
                            <img src="${contextPath}/resources/img/stroy/img_story01.33f0084e.jpg" alt="스토리사진1">
                            <h3>GLOBAL 버거킹</h3>
                            <p>세계 최대 QSR(Quick Service Restaurant) 브랜드 중 하나인 버거킹은 1954년 미국 마이애미에서 James W.McLamore와 David Edgerton에 의해 설립되었습니다. 
                                버거킹은 현재 100개 이상의 국가에서 15,000개 이상의 매장을 운영하고 있습니다. 고기를 팬에 굽는 일반 QSR과는 달리, 버거킹은 고기를 직접 불에 구워 조리하는 
                                직화 방식 (Flame-Broiling)으로 담백하고 풍부한 맛과 향, 그리고 정통 햄버거의 풍미를 선보이고 있습니다. 
                                버거킹의 대표 제품인 와퍼(Whopper)는 100% 순 쇠고기 패티와 함께 양상추, 토마토, 양파, 피클 등 4가지 신선한 야채가 어우러진 풍부한 맛으로 
                                전세계 고객에게 사랑 받고 있습니다. 세계적으로 “Taste is King”이라는 슬로건을 바탕으로 일상에서 맛볼 수 있는 작은 즐거움을
                                 고객에게 제공하기 위해 항상 최선을 다하고 있습니다. </p>
                        </div>
                        <div class="about">
                            <img src="${contextPath}/resources/img/stroy/img_story02.0e5ce49b.jpg" alt="스토리사진2">
                            <h3>버거킹 KOREA</h3>
                            <p>버거킹은 지난 1984년 종로점을 오픈하며 한국에 진출한 이래, 차별화된 제품과 개성 있는 매장 인테리어로 지난 30년간 한국 소비자의 사랑을 받아오고 있습니다.
                                 “가장 맛있는 햄버거를 제공하는 프리미엄 QSR 브랜드”로 자리매김한 버거킹은 현재 전국 369개(2019년 9월 기준) 매장을 운영하고 있습니다.
                                  좋은 품질의 제품(Quality)과 친절한 서비스 (Service) 그리고 청결한 매장(Cleanliness)은 고객 여러분께 더 큰 만족을 드리고자 노력하는 버거킹의 약속이자 가치입니다. 더욱 풍성하고 맛있는 제품과 정성을 다하는 고객 서비스로 여러분께 더욱 가까이 다가가도록 하겠습니다.</p>
                        </div>
                    </div>
                    <div class="story_box2 box2 hide">
                        <div class="history his1">
                            <div class="history_con">
                                <h4>2020</h4>
                                <ul>
                                    <li><p>6월 현재 403개 매장 보유</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2019</h4>
                                <ul>
                                    <li><p>'독퍼(Dogpper)' 2019 앤어워드 F&B 부문 Digital AD Winner 수상</p></li>
                                    <li><p>‘올데이킹 사딸라’ 제13회 대학생이 뽑은 좋은 광고 대상 수상</p></li>
                                    <li><p>‘올데이킹 사딸라’ 2019 서울영상광고제 TV부문 동상 수상</p></li>
                                    <li><p>380호점 하남미사점 오픈</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2018</h4>
                                <ul>
                                    <li><p>24시간 딜리버리 서비스 도입</p></li>
                                    <li><p>서브웨이 그릴 셸프(Subway Grill Shelf) ‘국민이 선택한 좋은 광고상’
                                        <br>옥외광고 부문 수상</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2017</h4>
                                <ul>
                                    <li><p>300호점 약수역점 오픈</p></li>
                                    <li><p>통새우와퍼 광고 서울영상광고제 2016 TV부문 수상</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2016</h4>
                                <ul>
                                    <li><p>버거킹 앱 출시</p></li>
                                    <li><p>무인결제시스템(KIOSK) 서비스 도입</p></li>
                                    <li><p>‘아침은 왕처럼’ 캠페인, ‘국민이 선택한 좋은 광고상’ 온라인부문 수상</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2015</h4>
                                <ul>
                                    <li><p>‘아침은 왕처럼’ 캠페인, 칸 국제광고제 미디어 부문 은상 수상</p></li>
                                </ul>
                            </div>
                        </div>
                        <div class="history his2">
                            <div class="history_con">
                                <h4>2014</h4>
                                <ul>
                                    <li><p>한국 버거킹 런칭 30주년</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2013</h4>
                                <ul>
                                    <li><p>딜리버리 서비스 도입</p></li>
                                    <li><p>아시아 1,000호점 개점 (과천중앙점)</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2011</h4>
                                <ul>
                                    <li><p>버거킹 아시아퍼시픽 컨퍼런스 FRANCHISE OF THE YEAR 2011 수상<br>(아시아퍼시픽 14 국가 중 1위)</p></li>
                                    <li><p>KS-SQ(한국서비스품질지수) 패스트푸드부문 1위</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2009</h4>
                                <ul>
                                    <li><p>국가 고객만족도 6년 연속 1위 수상</p></li>
                                    <li><p>KS-SQ(한국서비스품질지수) 패스트푸드부문 1위</p></li>
                                </ul>
                            </div>    
                        </div>
                        <div class="history his3">
                            <div class="history_con">
                                <h4>2004</h4>
                                <ul>
                                    <li><p>한국 능률협회 선정 주요 패스트푸드 고객만족지수 4년 연속 1위</p></li>
                                    <li><p>한국 표준협회 선정 주요 패스트푸드 서비스품질지수 1위</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>2000</h4>
                                <ul>
                                    <li><p>미국 BURGERKING CO. 주최 BIM 개최 프랜차이즈<br>
                                        최우수상, 마케팅상 수상</p></li>
                                </ul>
                            </div>
                            <div class="history_con">
                                <h4>1984</h4>
                                <ul>
                                    <li><p>1호점 종로점 오픈</p></li>
                                </ul>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        