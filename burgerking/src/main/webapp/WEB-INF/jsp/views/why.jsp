<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="resources/js/story_btn.js"></script>
<link rel="stylesheet" href="resources/css/story_common.css" />
<style>
/* 버튼 */
.con_btn_box {max-width: 1144px; height: 70px; padding: 0;}
.con_btn_box li {float: left; width: 25%; }
.con_btn_box li input {display: none;}
.con_btn_box li label {display: inline-block; border: 0; width: 100%; font-size: 23px; padding: 23px 0; font-weight: bold;
 border-bottom: 2px solid #000; color: silver; background-color: #f2f2f2; text-align: center; box-sizing: border-box; cursor: pointer;}
.con_btn_box li input:checked + label {color: #000; border: 2px solid #000; border-bottom: 0; background-color: #fff;}
.show {display: block;}
.hide {display: none;}

.why_con {width: 100%; height: 100%;}
.why_box {max-width:1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.why1_box1 { padding-top: 130px;}
.back_img_box1 {width: 1440px; height: 480px; background: url(resources/img/event/bg_grill.b2a4d0db.jpg)no-repeat; margin: 0 auto; margin-top: 100px; position: relative;}
.why1_box1 ul {width: 580px; float: left; padding: 0; margin-top: 100px; margin-left: 10px;}
.why1_box1 li p {font-size: 18px; margin-left: 9px;}
.why1_box2 img {position: absolute; top: 80px; left: 15%;}
.why1_box2 p {position: absolute; width: 545px; color: #fff; font-size: 18px; line-height: 36px; top: 30%; right: 10%; }
.why2_box1 {clear: both; height: 600px; margin-top: 100px; margin-bottom: 100px;}
.why2_box1 ul {float: left; padding: 0;}
.why2_box1 ul li {float: left; width: 345px; margin-left: 54.5px; padding-top: 330px; position: relative;}
.why_beef::before {content: ""; height: 330px; width: 100%; position: absolute; top: 0; left: 0; background: url(resources/img/event/img_material_beef.366804a6.gif) no-repeat 50%;}
.why_vegetables::before {content: ""; height: 330px; width: 100%; position: absolute; top: 0; left: 0; background: url(resources/img/event/img_material_vegetable.ae40700e.gif) no-repeat 50%;}
.why_pickles::before {content: ""; height: 330px; width: 100%; position: absolute; top: 0; left: 0; background: url(resources/img/event/img_material_pickle.c8bce1a2.gif) no-repeat 50%;}
.why2_box1 ul li:first-child {margin-left: 0;}
.why2_box1 ul li p {font-size: 18px; line-height: 1.5;}
.back_img_box2 {position: relative; width: 1440px; height: 1159px; background: url(resources/img/event/bg_material_intro02.9a4180fe.gif)no-repeat; margin: 0 auto;}
.why2_box2 {width: 1144px; height: 100%;}
.why2_box2 span {position: absolute; color: #fff; font-size: 75px; line-height: 90px; font-weight: bold; top: 100px; }
.why2_box2 ul {width: 774px; float: right; margin-top: 100px;}
.why2_box2 ul li {position: relative; margin-bottom: 70px;}
.why2_box2 ul li h4 { color: #fff; font-size: 30px; line-height: 100px; margin: 0; padding-left: 120px;}
.why2_box2 ul li p {color: #fff; font-size: 18px; line-height: 30px;}
.why2_quality::before {position: absolute; top: 0; left: 0; content: ""; width: 100px; height: 100px; background: url(resources/img/event/quality_icon.png) no-repeat;}
.why2_service::before {position: absolute; top: 0; left: 0; content: ""; width: 100px; height: 100px; background: url(resources/img/event/service_icon.png) no-repeat;}
.why2_clean::before {position: absolute; top: 0; left: 0; content: ""; width: 100px; height: 100px; background: url(resources/img/event/clean_icon.png) no-repeat;}
.why3_box1 {width: 100%; height: 120px; padding-top: 130px;}
.why3_box1 h3 {margin: 0; font-size: 32px; line-height: 32px; color: #673102;}
.why3_box2 {width: 100%;}
.why3_box2 ul {float: left; margin-top: 50px;}
.why3_box2 ul li {width: 558px; float: left; margin-right: 28px; margin-bottom: 50px;}
.why3_box2 ul li:nth-child(even) {margin-right: 0;}
.why3_box2 ul li h4 {font-size: 32px; margin: 0; margin: 20px 0;}
.why3_box2 ul li p {font-size: 18px;}
.why4_box1 {width: 100%; padding-top: 130px; margin-bottom: 100px;}
.why4_box1 img {display: block; margin: 0 auto; margin-bottom: 70px;}
.why4_box1 p {text-align: center; font-size:20px; line-height: 25px; margin: 0;}
.why4_box1 span {display: block; text-align: center; font-size: 20px; line-height: 25px; font-weight: bold;}
</style>
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="/">Home</a>
                    <a href="/story.do">브랜드스토리</a>
                    <span>WHY 버거킹</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="subtit_wrap">
                        <p>브랜드 스토리</p>
                        <ul>
                            <li><a href="story.do">버거킹 스토리</a></li>
                            <li class="on"><a href="why.do">WHY 버거킹</a></li>
                            <li><a href="javascript:void(0)">버거킹 NEWS</a></li>
                        </ul>
                    </div> 
                    <ul class="con_btn_box">
                        <li>
                            <input type="radio" id="con_btn1" name="con_btn" checked>
                            <label for="con_btn1">FLAME GRILLED</label>
                        </li>
                        <li>
                            <input type="radio" id="con_btn2" name="con_btn">
                            <label for="con_btn2">신선한 재료</label>
                        </li>
                        <li>
                            <input type="radio" id="con_btn3" name="con_btn">
                            <label for="con_btn3">Trust in Taste</label>
                        </li>
                        <li>
                            <input type="radio" id="con_btn4" name="con_btn">
                            <label for="con_btn4">환경사회공헌</label>
                        </li>
                    </ul>       
                    </div>
                    <div class="why_con1 why_con show">
                        <div class="why1_box1 why_box">
                            <ul>
                                <li><img src="resources/img/event/txt_whopper.06ce336d.gif" alt="와퍼텍스트"></li>
                                <li><p>전 세계적으로 사랑 받는 WHOPPER는 불에 직접 구운 100% 순쇠고기 패티 위에 신선한 토마토, 양상추, 양파, 마요네즈, 케첩, 상큼한 피클을 올린 버거킹의 대표 제품입니다.</p></li>
                            </ul>
                            <img src="resources/img/event/bg_whopper.0592cfd3.png" alt="와퍼">
                        </div>
                        <div class="back_img_box1">
                            <div class="why1_box2 why_box">
                                <img src="resources/img/event/txt_flame_grilled.92305426.png" alt="Frame GRILLED이미지">
                                <p>버거킹은 1954년 이후로 고기를 팬에 굽는 일반 QSR과는 달리 고기를 직접 불에 구워 조리하는 직화 방식(Flame-Grilled) 으로 담백하고 풍부한 맛과 향,<br> 그리고 정통 햄버거의 풍미를 선보이고 있습니다. 이 과정에서 불필요한<br> 기름기는 제거되고 고기의 육즙은 그대로 보존되어, 고기의 독특한 맛과 향을<br> 느낄 수 있습니다. 불에 직접 구워 담백하고 풍부한 맛! 버거킹의 햄버거만이 드릴 수 있는 특별한 맛입니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="why_con2 why_con hide">
                        <div class="why2_box1 why_box">
                            <ul>
                                <li class="why_beef">
                                    <img src="resources/img/event/img_material_beef.366804a6_tit.gif" alt="">
                                    <p>버거킹의 소고기 패티는 100% 순쇠고기로 <br> 만들어졌으며, 어떠한 방부제나 첨가물이 <br> 들어가지 않습니다.</p>
                                </li>
                                <li class="why_vegetables">
                                    <img src="resources/img/event/img_material_vegetable.ae40700e_tit.gif" alt="">
                                    <p>버거킹의 모든 햄버거에는 엄격한 검수 과정을 통해 입고된 신선한 야채가 사용됩니다.<br> 항상 신선함을 추구하는 가치로, 매일 매장에서 토마토를 직접 준비합니다.</p>
                                </li>
                                <li class="why_pickles">
                                    <img src="resources/img/event/img_material_pickle.c8bce1a2_tit.gif" alt="">
                                    <p>풍부하고 신선한 야채와 어우러진 고소한<br> 마요네즈와 새콤달콤한 케첩은 정통 햄버거<br> 특유의 풍미를 제공합니다.</p>
                                </li>
                            </ul>
                        </div>
                        <div class="back_img_box2">
                            <div class="why2_box2 why_box">
                                <span>신선한<br>재료와<br>철저한<br>위생관리</span>
                                <ul>
                                    <li>
                                        <h4 class="why2_quality">QUALITY</h4>
                                        <p>버거킹은 자체적으로 엄격한 품질 관리 시스템을 운영하고 있습니다. 지속적인 관리를 통해 버거킹<br> 원재료는 최상의 품질을 유지합니다.
                                             올바른 품질 관리가 이루어지고 있는 업체만을 선정하여 원재료를<br>  공급받고, 자재가 매장에 입고될 땐 자체적으로 유통기한 및 제품 온도를
                                              검사하여 기준에 미치지 못하는 <br>제품은 반송합니다. 또한 입고 후에도 보관 제품의 신선도 유지와 변질 방지에 한치의 소홀함도 <br>용납하지 않음으로써,
                                               버거킹을 방문하시는 고객들에게 최상의 맛과 품질을 가진 제품만을 제공합니다.</p>
                                    </li>
                                    <li>
                                        <h4 class="why2_service">SERVICE</h4>
                                        <p>정확, 친절한 서비스를 제공하기 위해 최선을 다하고 있습니다. 신속한 주문을 위해서 고객이 주문 후 <br>1분 안에 제품을 받을 수 있도록 노력하고 있으며,
                                             또한 오류 없는 정확하고 친절한 서비스를 위해 별도로<br> 카운터 응대 교육을 시행 중 입니다. 버거킹을 찾아주시는 모든 고객들이 만족하실 수 있도록
                                              버거킹이 할<br> 수 있는 최고의 서비스, 밝은 미소와 감사하는 마음으로 고객들을 맞이하고 있습니다.</p>
                                    </li>
                                    <li>
                                        <h4 class="why2_clean">CLEANILINESS</h4>
                                        <p>아무리 맛 좋은 음식이라도 비위생적이라면 고객에게 독과 같다는 것이 버거킹의 신념 중 하나입니다. 버거킹의 매니저들은
                                             미국 NRA(National Restaurant Association)에서 실시하는 AFS(Applied Foodservice Sanitation) 과정을 수료하고 테스트에 합격하여 매장 내의
                                              위생에 관한 개념이 철저합니다. 그리고 모든 직원들은 개인 위생은 물론, 제품 온도와 기계/소도구를 규정된 절차에 따라 관리함으로써
                                               최상의 청결 및 위생상태를 유지하여 고객이 안심하고 드실 수 있도록 노력하고 있습니다.</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div> 
                    <div class="why_con3 why_con hide">
                        <div class="why3_box1 why_box">
                            <h3>Trust in Taste란? 전세계 버거킹의 고객들이 우리 제품에 만족감을 느낄 수 있도록 하는 활동입니다. 버거킹 코리아는 전세계 버거킹의 가치인 Trust in Taste를 시행하며 최고의 제품과 서비스를 제공하기 위해 노력하고 있습니다.</h3>
                        </div>
                        <div class="why3_box2 why_box">
                            <ul>
                                <li>
                                    <img src="resources/img/event/img_TNT01.ea7c7e5b.jpg" alt="TIT1">
                                    <h4>Trust in Taste 1.최고의 버거</h4>
                                    <p>WHOPPER의 맛과 퀄리티를 개선하여 고객들이 최고의 맛을 느낄 수 있도록 합니다. 버거킹의 자산인 Flame_Grilling방식으로 더욱 특별한 맛을 제공합니다. 버거킹의 소고기패티는 100% 순쇠고기로 만들어졌으며, 어떠한 방부제나 첨가물이 들어가지 않습니다.</p>
                                </li>
                                <li>
                                    <img src="resources/img/event/img_TNT02.6358a079.jpg" alt="TIT2">
                                    <h4>Trust in Taste 2.최고의 치킨</h4>
                                    <p>버거킹은 고객에게 가장 맛이 좋은 치킨 제품을 제공합니다.</p>
                                </li>
                                <li>
                                    <img src="resources/img/event/img_TNT03.276c1779.jpg" alt="TIT3">
                                    <h4>Trust in Taste 3.재료</h4>
                                    <p>버거킹은 고객에게 높은 품질의 제품을 제공하기 위해 재료에 대한 내부 정화 정책을 시행합니다.</p>
                                </li>
                                <li>
                                    <img src="resources/img/event/img_TNT04.f427b94c.jpg" alt="TIT4">
                                    <h4>Trust in Taste 4.주방</h4>
                                    <p>버거킹의 주방 배치는 고객에게 신선한 준비 과정을 보여주며 품질 인식을 개선합니다.</p>
                                </li>
                            </ul>    
                        </div>
                    </div>
                    <div class="why_con4 why_con hide">
                        <div class="why4_box1 why_box">
                            <img src="resources/img/event/@img_contribution.3e5c1214.png" alt="">
                            <p>환경을 위한 작은 실천</p>
                            <p>개인 음료 컵 사용 시</p>
                            <span>탄산음료(단품) 200원 할인</span>
                        </div>
                    </div>
                </div>
            </div>
        
        