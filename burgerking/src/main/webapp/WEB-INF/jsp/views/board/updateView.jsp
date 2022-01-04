<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.notice_box {width: 100%; height: 100%;}
.notice_tit_box {width: 100%; border-top: 3px solid #000; border-bottom: 3px solid #ccc; padding: 20px; background: #fafafa; }
.notice_tit_box input {width: 700px; font-size: 25px;}
.notice_tit_box span {font-size:20px; color:#888; display:inline-block; float: right; margin-left: 20px;}
.notice_content {width: 100%; min-height: 500px; font-size: 20px; line-height: 1.5; padding: 20px;}
.notice_content textarea {width: 100%; height: 500px; font-size:20px; resize:none;}
.btn_box {width: 100%; height: 100px; margin: auto; text-align: center; padding: 0 20px; border-top: 3px solid #000;}
.btn_box input {width: 300px; height: 50px; font-size: 25px; margin: 20px 25px; border-radius: 8px;}
.update_btn {background:#000; color:#fff; border: 0;}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$("#update_btn").on("click", function(){
				if($("input[name=title]").val() == "" || $("input[name=title]").val() == null ) {
					alert("제목을 입력하세요.");
					title.focus();
					return false
				}
				if($("textarea[name=content]").val() == "" || $("textarea[name=content]").val() == null ) {
					alert("내용을 입력하세요.");
					content.focus();
					return false
				}
				
				if($("input[name=title]").val() != "" && $("input[name=title]").val() != "") {
					$("form[name=updateForm]").submit();
				}
			});
			$(".list_btn").on("click", function(){
				history.back();	
			});
		});
	
</script>
			<div id="content">
            	<div class="site_locate">
	                <div class="locate_box">
	                    <a href="../">Home</a>
	                    <span>고객센터</span>
	                    <a href="../board/list">공지사항</a>
	                </div>
	            </div>
	            <div class="con_wrap">
	                <div class="content_box">
						<form action="./update.do" name="updateForm" method="post" >
							<input type="hidden" name="bno" value="${update.bno}" />
							<div class="notice_box">
								<div class="notice_tit_box">
									<input type="text" name="title" value="${update.title}" />
									<span class="notice_regdate">${update.regdate}</span>
									<span class="notice_hit" >조회수 | ${update.hit}</span>
								</div>
								<div class="notice_content">
									<textarea name="content" ><c:out value="${update.content}" /></textarea>
								</div>
							</div>			
							<div class="btn_box">
								<input type="button" class="update_btn" id="update_btn" value="수정"/>
								<input type="button" class="list_btn" value="이전으로"/>						
							</div>
						</form>
					</div>
				</div>
			</div>

