
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://code.jquery.com/jquery-latest.js"></script>	 
<style>
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.notice_box {width: 100%; height: 100%; border-bottom: 3px solid #000; padding-right:40px;}
.notice_tit_box {width: 100%; border-top: 3px solid #000; border-bottom: 3px solid #ccc; padding: 20px; background: #fafafa; }
.notice_tit_box input {width: 100%; height: 30px; font-size:25px;}
.notice_hit {display:inline-block; float: right;}
.notice_content {width: 100%; font-size: 20px; line-height: 1.5; padding: 20px;}
.notice_content textarea {width: 100%; height: 500px; font-size:20px; resize:none;}
.btn_box {width: 1000px; height: 100px; margin: 0 auto; text-align: center;}
.btn_box input {width: 300px; height: 50px; font-size: 25px; margin: 25px 50px 0 50px; border-radius: 8px; cursor:pointer;}
.list_btn { background:#000; color:#fff; border: 0;}
</style>
<script>	
$(document).ready(function(){
	
	$(".write_btn").on("click", function(){
		if($("input[name=title]").val() == "" || $("input[name=title]").val() == null ) {
			alert("제목을 입력하세요.");
			$("input[name=title]").focus();
			return false
		}
		if($("textarea[name=content]").val() == "" || $("textarea[name=content]").val() == null ) {
			alert("내용을 입력하세요.");
			$("textarea[name=content]").focus();
			return false
		}
		
		$("form[name=write_form]").submit();
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
	                	<form name="write_form" action="write.do" method="POST">
	                		<div class="notice_box">
								<div class="notice_tit_box">
									<input type="text" name="title" />
								</div>
								<div class="notice_content">
									<textarea name="content"></textarea>
								</div>
							</div>
							<input type="hidden" name="writer" value="${member.userId}" />			
							<div class="btn_box">
								<input type="submit" class="write_btn" value="작성"/>
								<input type="button" class="list_btn" value="목록"/>						
							</div>
	                	</form>
					</div>
				</div>
			</div>

