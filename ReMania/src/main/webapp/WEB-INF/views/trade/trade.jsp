<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>remaina</title>
<style>
	.alert {font-size: 1.5em;}
	
	.boardList {font-size: 1em;}
	.boardList th, .boardList td {border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 14px 0 10px 0;}
	.boardList th {background: #f8f8f8; text-align: center;}
	
	#reple {background-color: #FFFFFF;}
	#repleWriteFormleft {float: left;}
	
	#bedRoomDetailWrap {width: 80%;height: auto; margin: 0 auto;}
	#bedRoomDetailVisual {width: 100%; height: 20em;}
	#bedRoomDetailVisualleft {width: 50%; height: 100%; float: left;}
	#bedRoomDetailVisualRight {height: 100%;}
	#bedRoomDetailContent {width: 70%; height: auto; margin: 0 auto;}
	
	.visualRightTable {margin: 0 auto; text-align: left;}
	.visualRightTable .productName {color: gray; font-size: 15px; font: bold;}
	.visualRightTable .productPrice {color: #5b6bdf; font-size: 15px; font: bold;}
	.visualRightTable .productPrice2 {color: red; font-size: 15px; font: bold;}
	.visualRightTable .productPrice3 { color: #3f4993; font-size: 15px; font: bold;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	/* 판매취소 함수 */
	$(document).ready(function(){
		
		$("#sellCancel").on("click", function(){
			if(confirm("정말로 판매를 취소하시겠습니까?")){
				alert("판매 취소가 접수되었습니다.");
				location.replace("cancel?tradenum=${tradeDTO.tradenum}&title=${buyDTO.title}&buyerTel=${buyer.tel}&category=${tradeDTO.category}&buynum=${buyDTO.buynum}&cancel=sellcancel");
			}
		});
		
		$("#buyCancel").on("click", function(){
			if(confirm("정말로 구매를 취소하시겠습니까?")){
				alert("구매 취소가 접수되었습니다.");
				location.replace("cancel?tradenum=${tradeDTO.tradenum}&title=${buyDTO.title}&buyerTel=${buyer.tel}&category=${tradeDTO.category}&buynum=${buyDTO.buynum}&cancel=buycancel");
			}
		});
		
		//인수확인 버튼
		$("#takeover").on("click", function(){
			if(confirm("정말로 인수 확인 하시겠습니까?")){
				location.replace("takeover?trade=takeover&tradenum=${tradeDTO.tradenum}");
			}
		});
		
		//인계확인 버튼
		$("#transfer").on("click", function(){
			if(confirm("정말로 인계 확인 하시겠습니까?")){
				location.replace("transfer?trade=transfer&tradenum=${tradeDTO.tradenum}");
			}
		});
		
		// 신고 버튼
		$("#reportTo").on("click",function(){
			if(confirm("상대방을 신고 하시겠습니까?")){
				var tradenum = ${tradeDTO.tradenum};
				var transfer = '${tradeDTO.transfer}';
				var takeover = '${tradeDTO.takeover}';
				if(${login.email == buyer.email}){
					var victim = "${buyer.name}(${buyer.email})";
					var assailant = "${seller.name}(${seller.email})";
				}else if(${login.email == seller.email}){
					var victim = "${seller.name}(${seller.email})";
					var assailant = "${buyer.name}(${buyer.email})";
				}
				location.href="reportTo?tradenum="+tradenum+"&transfer="+transfer+"&takeover="+takeover+"&victim="+victim+"&assailant="+assailant;
			}
		});
	});
	
</script>

</head>
<body>

	<c:set var="login" value="${login}" scope="session" />
	<c:set var="buyer" value="${buyer}" scope="request" />
	<c:set var="seller" value="${seller}" scope="request" />
	
	<jsp:include page="../include/nav.jsp" flush="true" />
	<jsp:include page="../include/trade/buyDetailInclude.jsp" flush="true" />
	
	<c:if test="${!empty ReportTo && login.email == ReportTo.victim.substring(ReportTo.victim.indexOf('(')+1 , ReportTo.victim.indexOf(')'))}">
		<h1 style="color: red" align="center">신고 접수 된 게시물 입니다.</h1>
	</c:if>
	<hr />
	
	<div class="container">
		<!-- 구매자 -->
		<div class="panel panel-danger" style="width: 50%; float: left;">
			<div class="panel-heading" style="background-color: #d9534f;">
				<h5 style="color: white;">
					구매자
					<c:if test="${login.name == buyer.name}">(나)</c:if>
					<c:if test="${login.name != buyer.name}">(상대방)</c:if>
				</h5>
			</div>
			<div class="panel-body">
				<div style="background-color:#d9534f; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">이름</span>
					<input type="text" readonly value="${buyer.name}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#d9534f; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">연락처</span>
					<input type="text" readonly value="${buyer.tel}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#d9534f; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">주소</span>
					<input type="text" readonly value="${buyer.addr1}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
		</div><!-- .panel panel-danger --> <!-- a -->
		
		<!-- 판매자 -->
		<div class="panel panel-primary" style="width: 50%; float: left;">
			<div class="panel-heading">
				<h5>
					판매자
					<c:if test="${login.email == seller.email}">(나)</c:if>
					<c:if test="${login.email != seller.email}">(상대방)</c:if>
				</h5>
			</div>
			<div class="panel-body">
				<div style="background-color:#337ab7; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">이름</span>
					<input type="text" readonly value="${seller.name}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#337ab7; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">연락처</span>
					<input type="text" readonly value="${seller.tel}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#337ab7; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">주소</span>
					<input type="text" readonly value="${seller.addr1}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
		</div><!-- .panel panel-danger -->
		
		<div style="text-align: center;">
			<c:choose>
				<c:when test="${!empty tradeDTO.takeover && !empty tradeDTO.transfer}">
					<div>
						<h2>이 거래는 종료되었습니다.</h2>
					</div>
				</c:when>
				<c:when test="${login.email == seller.email}">
					<c:if test="${empty tradeDTO.transfer}">
						<button type="button" class="btn btn-primary" id="transfer"
							style="width: 15em; border-radius: 3em;">
							인계 확인
						</button>
						<button type="button" class="btn btn-default" id="sellCancel"
							style="width: 15em; border-radius: 3em; background-color: lightgray;">
							판매 취소
						</button>
					</c:if>
					<c:if test="${!empty tradeDTO.transfer}">
						<div>
							인계확인!<br />
							구매자가 인계 확인을 하면 거래가 완료됩니다.
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${empty tradeDTO.takeover}">
						<button type="button" class="btn btn-danger" id="takeover"
							style="width: 15em; border-radius: 3em; background-color: #d9534f;">
							인수 확인
						</button>
						<button type="button" class="btn btn-default" id="buyCancel"
							style="width: 15em; border-radius: 3em;">
							구매 취소
						</button>
					</c:if>
					<c:if test="${!empty tradeDTO.takeover}">
						<div>
							인수확인!<br />
							판매자가 인계 확인을 하면 거래가 완료됩니다.
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
		
		<c:if test="${empty ReportTo || login.email != ReportTo.victim.substring(ReportTo.victim.indexOf('(')+1 , ReportTo.victim.indexOf(')'))}">
			<div align="right">
			<form name="reportTo" action="reportTo" method="post">
				<input type="hidden" name="tradenum" value="${tradeDTO.tradenum}"/>
				<input type="hidden" name="transfer" value="${tradeDTO.transfer}"/>
				<input type="hidden" name="takeover" value="${tradeDTO.takeover}"/>
				<c:if test="${login.email == buyer.email}">
					<input type="hidden" name="victim" value="${buyer.name}(${buyer.email})"/>
					<input type="hidden" name="assailant" value="${seller.name}(${seller.email})"/>
				</c:if>
				<c:if test="${login.email == seller.email}">
					<input type="hidden" name="victim" value="${seller.name}(${seller.email})"/>
					<input type="hidden" name="assailant" value="${buyer.name}(${buyer.email})"/>
				</c:if>
				<font color="#fafa7d">
					<button type="button" id="reportTo" class="btn" style="background-color: red; border-radius: 2em;">신고 하기</button>
				</font>
			</form>
			</div>
		</c:if>
		
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="true" />
	
</body>
</html>