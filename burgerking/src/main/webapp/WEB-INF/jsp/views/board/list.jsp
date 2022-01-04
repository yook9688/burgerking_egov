<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<style>
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px; margin: 0 20px;}
.subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
.subtit_wrap ul {float: right; width: auto; margin-top: 10px;}
.subtit_wrap ul li {float: left; width: fit-content; margin: 0  15px;}
.subtit_wrap ul li a {font-size: 18px; color: #2e2e2e; }
.premenu_cate_box {font-size: 20px; text-align: center;}
.notice_table {width: 100%; border-top: 3px solid #000; border-bottom: 3px solid #000 ;}
.notice_table tr {padding: 0; height: 50px; font-size: 20px;}
.notice_table thead tr {height: 50px; border-bottom: 3px solid #999; box-sizing: border-box;}
.notice_bno {width: 10%; text-align: center;}
.notice_tit {width: 60%;}
.notice_date {width: 20%; text-align: center;}
.notice_hit {width: 10%; text-align: center;}
.search_box {width: 900px; height: 70px; margin: 30px auto;}
.search_box select {width: 150px; height: 40px; font-size: 20px; }
.search_box #keywordInput {width: 500px; height: 40px; margin: 0 20px; font-size: 25px; border: 0; background: url("../resources/img/common/input_back.png") repeat-x 0 100%;}
.search_btn {width:54px; height: 54px; border:0; vertical-align:bottom; background: url("../resources/img/common/notice_search_btn.png") no-repeat; cursor: pointer;}
.write_btn {width: 70px; height: 30px; margin-left: 30px;}
.page_num_box {width:auto; height: 70px; font-size: 25px; text-align: center;}


.no_data {height: 200px; text-align: center;}

</style>
<script>
	$(function(){
		$(".search_btn").click(function() {			
	  		self.location = "list.do?page=${scri.page}&searchType="+$("select option:selected").val()+"&keyword="+$("#keywordInput").val();
	  	});
		
		$(document).on("keydown", "#keywordInput", function(key){
			if(key.keyCode == 13) {
				$(".search_btn").click();
			}
		});
		
		$(".write_btn").on("click", function(){
			location.href="./writeView.do";
		});
		
	}); 
	
	function linkPage(pageNo) {
		location.href="./list.do?page="+pageNo+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	}
</script>
		 <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="../">Home</a>
                    <span>고객센터</span>
                    <a href="../board/list.do">공지사항</a>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="subtit_wrap">
                        <p>고객센터</p>
                        <ul>
                            <li class="menu_tit_list"><a class="menu_tit" href="./list.do" >공지사항</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="javascript:void(0)" >버거킹앱 이용안내</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="javascript:void(0)" >FAQ</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="javascript:void(0)" >문의</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="javascript:void(0)" >가맹점모집</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="javascript:void(0)" >인재채용</a></li>
                        </ul>
                    </div>
                    <div class="premenu_cate_box">
						<h2>공지사항</h2>
					</div>
					<table class="notice_table">
						<thead>
							<tr>
								<th class ="notice_bno">NO.</th>
								<th class="notice_tit">제목</th>
								<th class="notice_date">날짜</th>
								<th class="notice_hit">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:set var="count" value="${pagination.totalRecordCount-((pagination.currentPageNo-1)*pagination.recordCountPerPage)}"/>
									<c:forEach items="${list}" var="noticeList" varStatus="status">
										<tr>
											<td class="notice_bno"><c:out value="${count}" /></td>
											<td class="notice_tit"><a href="./readView.do?bno=${noticeList.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${noticeList.title}" /></a></td>
											<td class="notice_date"><fmt:formatDate value="${noticeList.regdate}" pattern="yyyy-MM-dd"/></td>
											<td class="notice_hit"><c:out value="${noticeList.hit}" /></td>
										</tr>
										<c:set var="count" value="${count-1}"></c:set>
									</c:forEach>	
								</c:when>
								<c:otherwise>
									<tr>
										<td class="no_data" colspan="100%">공지사항 목록이 없습니다.</td>										
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div class="search_box">
					    <select name="searchType" >
					      <option value="tc"<c:out value="${(scri.searchType == null || scri.searchType eq 'tc') ? 'selected' : ''}"/>>전체</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					    </select>
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					    <input type="button" class="search_btn" />
					    <c:if test="${member.userType == 1}">
					    	<input type="button" class="write_btn" value="글쓰기"/>
					    </c:if>
					</div>
					<div class="page_num_box">
						<ui:pagination paginationInfo="${pagination}" jsFunction="linkPage" type="text"/>
					</div>
				</div>
            </div>
        </div>

