<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0">
    <title>버거킹</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="resources/css/common.css">
    <style>
    
    /* 콘텐츠 */
    #content {clear: both; width: 100%; height: 100%; }
    .con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
    .content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
    .subtit_wrap {max-width: 1144px; margin: 0 20px;}
    .subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
    .subtit_wrap ul {float: right; width: auto;}
    .subtit_wrap ul li {float: left; width: fit-content; margin: 0  15px;}
    .subtit_wrap ul li a {font-size: 18px; color: #2e2e2e; }
    .on {border-bottom: 3px solid #e22219; }
    .premenu_list_box {clear: both; width: 100%; height: 100%;}
    .premenu {float: left; max-width: 1144px;  padding: 0 0 30px 0;}
    .col4 {max-width: 276px; width: 276px; height: 259px; }
    .menu_list {float: left; margin: 0 5px; margin-top: 30px;}
    .menu_list a {width: 276px; height: 259px; color: #000;}
    .img_box {max-width: 220px; height: 144px; margin: 0 auto;}
    .img_name {min-width: 115px; padding: 30px 5px 0; font-size: 20px; text-align: center; font-weight: bold;}
    .img_box1 {background: url(resources/img/menu/기네스와퍼팩1.png) no-repeat; background-size: contain;}
    .img_box2 {background: url(resources/img/menu/기네스와퍼팩2.png) no-repeat; background-size: contain;}
    .img_box3 {background: url(resources/img/menu/기네스와퍼팩3.png) no-repeat; background-size: contain;}
    .img_box4 {background: url(resources/img/menu/기네스와퍼팩4.png) no-repeat; background-size: contain;}
    .img_box5 {background: url(resources/img/menu/메가몬스터X.png) no-repeat; background-size: contain;}
    

    


    
    </style>
</head>
<body>
    <div id="wrap">
        <div id="hd">
            <div class="hd_wrap">
                <a href="/" class="logo"><img src="resources/img/main/logo_header.gif" alt="로고"></a>
                <nav class="gnb">
                    <ul class="main">
                        <li>
                            <span>메뉴소개</span>
                            <img src="resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="sub1_1.html">스페셜&할인팩</a></li>
                                <li><a href="sub1_2.html">프리미엄</a></li>
                                <li><a href="sub1_3.html">와퍼</a></li>
                                <li><a href="sub1_4.html">주니어&버거</a></li>
                                <li><a href="sub1_5.html">올데이킹&치킨버거</a></li>
                                <li><a href="sub1_6.html">사이드</a></li>
                                <li><a href="sub1_7.html">음료&디저트</a></li>
                                <li><a href="sub1_8.html">아침메뉴</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>매장소개</span>
                            <img src="resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="sub2.html">매장찾기</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>이벤트</span>
                            <img src="resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="javascript:void(0)">이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>브랜드스토리</span>
                            <img src="resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="sub4_1.html">버거킹 스토리</a></li>
                                <li><a href="sub4_2.html">WHY 버거킹</a></li>
                                <li><a href="sub4_3.html">버거킹 NEWS</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <button class="dil_btn">
                    <span>딜리버리주문</span>
                </button>
            </div>
        </div>
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
                            <li class="on"><a href="sub1_1.html">스페셜&할인팩</a></li>
                            <li><a href="sub1_2.html">프리미엄</a></li>
                            <li><a href="sub1_3.html">와퍼</a></li>
                            <li><a href="sub1_4.html">주니어&버거</a></li>
                            <li><a href="sub1_5.html">올데이킹&치킨버거</a></li>
                            <li><a href="sub1_6.html">사이드</a></li>
                            <li><a href="sub1_7.html">음료&디저트</a></li>
                            <li><a href="sub1_8.html">아침메뉴</a></li>
                        </ul>
                    </div>
                    <div class="premenu_list_box">
                        <ul class="premenu">
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box1 img_box"></div>
                                    <div class="img_name">
                                        <p>기네스와퍼팩1</p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box2 img_box"></div>
                                    <div class="img_name">
                                        <p>기네스와퍼팩2</p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box3 img_box"></div>
                                    <div class="img_name">
                                        <p>기네스와퍼팩3</p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box4 img_box"></div>
                                    <div class="img_name">
                                        <p>기네스와퍼팩4</p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box5 img_box"></div>
                                    <div class="img_name">
                                        <p>메가몬스터X</p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box6 img_box"></div>
                                    <div class="img_name">
                                        <p></p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box7 img_box"></div>
                                    <div class="img_name">
                                        <p></p>
                                    </div>
                                </a>
                            </li>
                            <li class="menu_list col4">
                                <a href="">
                                    <div class="img_box8 img_box"></div>
                                    <div class="img_name">
                                        <p></p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="sitemap">
            <div class="sitemap_wrap">
                <div class="sitemap_con_wrap">
                    <ul class="sitemap">
                        <li>
                            <a href="sub1_1.html">메뉴</a>
                            <ul class="sitemap_sub">
                                <li><a href="sub1_1.html">스페셜&할인팩</a></li>
                                <li><a href="sub1_2.html">프리미엄</a></li>
                                <li><a href="sub1_3.html">와퍼</a></li>
                                <li><a href="sub1_4.html">주니어&버거</a></li>
                                <li><a href="sub1_5.html">올데이킹&치킨버거</a></li>
                                <li><a href="sub1_6.html">사이드</a></li>
                                <li><a href="sub1_7.html">음료&디저트</a></li>
                                <li><a href="sub1_8.html">아침메뉴</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">매장</a>
                            <ul class="sitemap_sub">
                                <li><a href="javascript:void(0)">매장찾기</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">이벤트</a>
                            <ul class="sitemap_sub">
                                <li><a href="javascript:void(0)">이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="sub4_1.html">브랜드 스토리</a>
                            <ul class="sitemap_sub">
                                <li><a href="sub4_1.html">버거킹 스토리</a></li>
                                <li><a href="sub4_2.html">WHY 버거킹</a></li>
                                <li><a href="sub4_3.html">버거킹 News</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:void(0)">고객센터</a>
                            <ul class="sitemap_sub">
                                <li><a href="javascript:void(0)">공지사항</a></li>
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
        <div id="ft">
            <div class="ft_wrap">
                <div class="copyright">
                    <h2><img src="resources/img/main/ft_logo.gif" alt="하단버거킹로고"></h2>
                    <p>서울 종로구 삼봉로 71 G타워 2층 주식회사 비케이알 | 전화주문 1599-0505</p>
                    <p>사업자 등록번호 101-86-76277 | (주)BKR 대표이사 문영주</p>
                    <p>Copyright 2020 YHS All right Reserved</p>
                </div>
                <div class="ft_menu">
                    <a href="javascript:void(0)">이용약관</a>
                    <a href="javascript:void(0)">개인정보취급방침</a>
                    <a href="javascript:void(0)">법적고지</a>
                    <div class="c_btn">
                        <a href="javascript:void(0)">인재채용</a>
                        <a href="javascript:void(0)">가맹점모집</a>
                    </div>
                </div>   
            </div>
        </div>
    </div>
</body>
</html>