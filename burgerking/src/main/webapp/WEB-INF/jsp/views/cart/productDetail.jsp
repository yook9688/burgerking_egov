<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; min-height: 800px; padding: 0 0 45px 0;}
.content_box {width: 100%; height: 100%; }
.product_box {width: 100%; height: 400px; background-color: #000;}
.product_bg {width: 1440px; height: 400px; margin: 0 auto; background:url("${contextPath}/resources/img/menu_detail/bg_prd_detailintro.4e4e1753.png") no-repeat;}
.product_intro {max-width: 1144px; height: 400px; padding: 0 20px; margin: 0 auto; position: relative;}
.description_box {width: 600px; height: 150px;}
.description_box p {margin: 20px 0; font-size: 20px; color:#fff;}
.img_box {position: absolute; right: 0; bottom: 10%;}
.product_name {color:#fff; font-size:50px; margin: 0; line-height: 200px;}
.product_btn_box {width: 100%; height: 88px; background:url("${contextPath}/resources/img/menu_detail/bg_menu_subinfoWrap.23f3cf83.png");}
.product_btn_box div {max-width: 1144px; padding: 0 20px; margin: 0 auto; line-height: 88px;}
.product_add_form {display: inline-block; float:right; width: 500px; text-align: center;}
.product_add_form select {margin: 0 20px; width: 200px; height: 40px; font-size: 20px;}
.product_btn {color:#fff; font-size:24px; font-weight: bold; border: 0; background: transparent; cursor: pointer;}
.addCart_btn {color:#fff; font-size:24px; font-weight: bold; border: 0; background: transparent; margin-top: 29px; float: right; cursor: pointer;}
.product_option_box {max-width: 1144px;; height: 250px; margin: 40px auto;}
.option {display:inline-block; width: 343px; height: 250px; margin:0 17.5px; }
.option input {display: none;} 
.option input:checked + label {border: 3px dashed #000;}
.option label {display:block; width: 100%; height: 100%; text-align: center; font-size:25px; line-height: 70px; box-sizing: border-box; cursor: pointer;}
.option label span {text-align: center;}



</style>
<script>
	$(document).ready(function(){
		//제품명
		var pName = $("#pName").val();
		
		//메뉴 목록으로 돌아가기
		$(".product_btn").on("click", function(){
			window.history.back();
		});
		
		//장바구니에 담기
		$(".addCart_btn").on("click", function(){
			$(".product_add_form").submit();	
		});
		
		//상품 옵션 선택 이벤트
		$("input[name=p_option]").on("change", function(){
			var option = $(this).val();
			var price = $(this).next().children().text();
			if(option == "ls") {
				$("#drink1").val("콜라L");
				$("#side1").val("프렌치프라이L");
				$("#pName").val(pName+" 라지세트");
				$("#pOption").val("라지세트");
			} else if(option == "s") {
				$("#drink1").val("콜라R");
				$("#side1").val("프렌치프라이R");
				$("#pName").val(pName+" 세트");
				$("#pOption").val("세트");	
			} else {
				$("#drink1").val("");
				$("#side1").val("");
				$("#pName").val(pName);	
				$("#pOption").val("단품");	
			}
			$("#price").val(price);
		});
		
	});
</script>
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="${contextPath}/main.do">Home</a>
                    <a href="prolist?cate=${product.pCategory }">딜리버리</a>
                    <a href="prolist?cate=${product.pCategory }"><c:out value="${category_title}" /></a>
                    <span>${product.pName}</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="product_box">
                    	<div class="product_bg">
	                    	<div class="product_intro">
	                    		<div class="img_box">
	                    			<img src="../resources/${product.pUrl}" alt="${product.pName}사진" />
	                    		</div>
	                    		<h2 class="product_name">${product.pName}</h2>
	                    		<div class="description_box">
	                    		<p>${product.pDescription}</p>
	                    		</div>
	                    	</div>               
                    	</div>
                    	<div class="product_btn_box">
                    		<div>
                   				<button class="product_btn" type="button">← 메뉴 목록으로 돌아가기</button>
                   				<button class="addCart_btn" type="button">장바구니에 담기</button>
								<form action="../cart/addCart.do" class="product_add_form" method="post">
							<c:choose>
								<c:when test="${product.pCategory == 's'}"></c:when>
								<c:when test="${product.pCategory == 'd'}"></c:when>
								<c:otherwise>
									<select name="drink1" id="drink1" required>
		                    			<option value="콜라R">콜라R</option>
		                    			<option value="사이다R" >사이다R</option>
		                    			<option value="환타R">환타R</option>
		                    			<option value="아이스아메리카노R">아이스아메리카노R</option>
		                    		<c:if test="${product.pCategory != 'ss'}">
		                    			<option value="콜라L" >콜라L</option>
		                    			<option value="사이다L" >사이다L</option>
		                    			<option value="환타L">환타L</option>
		                    			<option value="아이스아메리카노L">아이스아메리카노L</option>
		                    			<option value="" selected>없음</option>
	                    			</c:if>
	                    			</select>
	                    			<input type="hidden" name="side1" id="side1" value="프렌치프라이L" />
	                    			<c:if test="${product.pCategory == 'ss'}">
	                    				<select name="drink2" id="drink2" required>
			                    			<option value="콜라R" selected>콜라R</option>
			                    			<option value="사이다R">사이다R</option>
			                    			<option value="환타R">환타R</option>
			                    			<option value="아이스아메리카노R">아이스아메리카노R</option>
		                    			</select>
		                    			<input type="hidden" name="side2" id="side2" value="너겟킹4조각" />
	                    			</c:if>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${product.pCategory == 'ss'}">
									<input type="hidden" name="pOption" id="pOption" value="할인팩"/>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="pOption" id="pOption" value="단품"/>
								</c:otherwise>
							</c:choose>
	                    			<input type="hidden" name="pCode" value="${product.pCode}" />
	                    			<input type="hidden" name="price" id="price" value="${product.price}" />
	                    			<input type="hidden" name="pName" id="pName" value="${product.pName}"/>
	                   			</form>
	                   		</div>		
                   		</div>
				<c:choose>
					<c:when test="${product.pCategory == 'ss'}"></c:when>
					<c:when test="${product.pCategory == 's'}"></c:when>
					<c:when test="${product.pCategory == 'd'}"></c:when>
					<c:otherwise>
						<div class="product_option_box">
               				<div class="option">
               					<input class="option_ls" id="option_ls" type="radio" name="p_option" value="ls"/>
               					<label for="option_ls">
	               					${product.pName}<br />프렌치프라이L+콜라L<br />
	               					<span>${product.price+2200}</span> &#8361;
               					</label>
            					</div>
               				<div class="option">
               					<input class="option_s" id="option_s" type="radio" name="p_option" value="s"/>
               					<label for="option_s">
	               					${product.pName}<br />프렌치프라이R+콜라R<br />
	               					<span>${product.price+1500}</span> &#8361;
								</label>
               				</div>
               				<div class="option">
               					<input class="option_n" id="option_n" type="radio" name="p_option" value="n"/>
               					<label for="option_n">
	               					${product.pName}<br />단품<br />
	               					<span>${product.price}</span> &#8361;
               					</label>
           					</div>
                  		</div>					
					</c:otherwise>
				</c:choose>
                    </div>
                </div>
            </div>
        </div>

