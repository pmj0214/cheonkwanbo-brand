<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<%@ include file="/WEB-INF/views/common/trackingTag.jsp"%>
<%-- 2020.04.16 팝업 삭제 요청 --%>
<%--<%@ include file="/WEB-INF/views/common/popup.jsp"%>--%>
<%@ include file="/WEB-INF/views/common/showget.jsp"%>
</head>
<body>
<div id="wrap">
	<div class="header">
		<div class="inner">
			<h1><img src="/pc/images/header.gif" alt="종근당건강 건강기능식품 천관보 1:1 무료 상담 1811-1478"/></h1>
		</div>
	</div>

	<div class="banner">
		<div class="inner">
			<img src="/pc/images/top_banner01.jpg" alt="천관보는 KBS 드라마 '한 번 다녀왔습니다' 와 함께합니다."/>
		</div>
	</div>

	<div class="contents">	
		<div class="kv">
			<div class="inner">
				<p><img src="/pc/images/kv_text01.png" alt="관절&연골 건강에는? 365일 관절 대들보 종근당건강 천관보"></p>
				<div class="input_area">
					<div class="title">
						<img src="/pc/images/db_title01.png" alt="종근당건강 천관보 공식 전화상담문의">
					</div>
					<div class="cont">
						<form id="frmDb_rightTop">
							<div class="area01">
								<div class="name">
									<label for="userName"><img src="/pc/images/db_text01.png" alt="성함"></label>
									<input type="text" name="userName" id="userName" placeholder="예) 홍길동" />
								</div>
								<div class="mobile">
									<label for="userMobile"><img src="/pc/images/db_text02.png" alt="연락처"></label>
									<input type="text" class="numbersOnly" name="userMobile" id="userMobile" placeholder="예) 01012345678" maxlength="11" />
								</div>
								<div class="consult">
									<label for="userConsult"><img src="/pc/images/db_text03.png" alt="상담내용"></label>
									<input type="text" name="userConsult" id="userConsult" placeholder="(선택 사항)"/>
								</div>
							</div>

							<div class="area02">
								<div class="age">
									<label for="userAge"><img src="/pc/images/db_text04.png" alt="상담내용"></label>
									<input type="text" class="numbersOnly" name="userAge" id="userAge" placeholder="예) 56" maxlength="2" title="나이" />
									<span>세</span>
								</div>
								<div class="sex">
									<input type="radio" id="gender-men01" name="gender" value="남" checked="checked">
									<label for="gender-men01">남</label>
									<input type="radio" id="gender-women01" name="gender" value="여">
									<label for="gender-women01">여</label>
								</div>
							</div>

							<div class="area03">
								<p><img src="/pc/images/db_text05.png" alt="개인정보취급동의"></p>
								<a href="#" data-role="open_popup" data-send="popup_agree" ><img src="/pc/images/db_btn01.png" alt="내용보기"/></a>
								<input type="checkbox" id="agree01" name="agree" checked="checked" /><label for="agree01"><img src="/pc/images/db_text06.png" alt="동의합니다"></label>
							</div>
							<div class="area04">
								<input type="checkbox" id="agreeAdvts01" name="agreeAdvts" checked="checked" /><label for="agreeAdvts01"><img src="/pc/images/db_text07.png?20200309183007" alt="광고성 정보(이메일, 전화,문자)를 수신하는데 동의합니다"></label>
							</div>
							<div class="area05">
<%--								<input type="checkbox" id="agreeThird01" name="agreeThird" checked="checked" /><label for="agreeThird01"><p>제 3자 제공 및 활용에 동의합니다</p></label>--%>
								<input type="checkbox" id="agreeThird01" name="agreeThird" checked="checked" /><label for="agreeThird01"><img src="/pc/images/db2_text07.png?20200514183007" style="top: 4px;" alt="제3자제공및활용동의"></label>
								<a href="#" data-role="open_popup" data-send="popup_agree" ><img src="/pc/images/db_btn01.png" alt="내용보기"/></a>
							</div>

							<div class="btn">
								<a href="javascript:void(0);"><img class="insertDb" src="/pc/images/db_btn02.png?20191127180005" alt="가격 확인"/></a>
								<a href="javascript:void(0);"><img class="insertDb" src="/pc/images/db_btn03.png?20191126184140" alt="전문 상담원 연결"/></a>
							</div>
							<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="s01">
			<div class="inner">
				<img src="/pc/images/s01_img01.gif?20191122145615" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s02">
			<div class="inner">
				<img src="/pc/images/s02_img01.gif" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s03">
			<div class="inner">
				<img src="/pc/images/s03_img01.gif" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>
		
		<div class="s04">
			<div class="inner">
				<img src="/pc/images/s04_img01.gif?20200312181030" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s05">
			<div class="inner">
				<img src="/pc/images/s05_img01.gif" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s06">
			<div class="inner">
				<img src="/pc/images/s06_img01.gif?20191119144530" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s07">
			<div class="inner">
				<img src="/pc/images/s07_img01.gif" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s08">
			<div class="inner">
				<img src="/pc/images/s08_img01.gif?20191122145555" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="float">
			<div class="inner">
				<div class="input_area">
					<div class="title">
						<img src="/pc/images/db2_title01.png" alt="종근당건강 천관보 공식 전화상담문의">
					</div>
					<form id="frmDb_floating">
						<div class="cont">
							<div class="area01">
								<div class="name">
									<label for="userName2"><img src="/pc/images/db_text01.png" alt="성함"></label>
									<input type="text" name="userName" id="userName2" placeholder="예) 홍길동" />
								</div>
								<div class="sex">
									<input type="radio" id="gender-men02" name="gender" value="남" checked="checked">
									<label for="gender-men02">남</label>
									<input type="radio" id="gender-women02" name="gender" value="여">
									<label for="gender-women02">여</label>
								</div>
								<div class="age">
									<label for="userAge2"><img src="/pc/images/db_text04.png" alt="상담내용"></label>
									<input type="text" class="numbersOnly" name="userAge" id="userAge2" placeholder="예) 56" maxlength="2" title="나이" />
									<span>세</span>
								</div>
							</div>

							<div class="area02">
								<div class="mobile">
									<label for="userMobile2"><img src="/pc/images/db2_text02.png" alt="연락처"></label>
									<input type="text" class="numbersOnly" name="userMobile" id="userMobile2" placeholder="예) 01012345678" maxlength="11" />
								</div>
								<div class="consult">
									<label for="userConsult2"><img src="/pc/images/db2_text03.png" alt="상담내용" ></label>
									<input type="text" name="userConsult" id="userConsult2" placeholder="(선택 사항)"/>
								</div>
							</div>

							<div class="area03">
								<input type="checkbox" id="agree02" name="agree" checked="checked" /><label for="agree02"><img src="/pc/images/db2_text05.png" alt="개인정보취급동의"></label>
								<a href="#" data-role="open_popup" data-send="popup_agree" ><img src="/pc/images/db2_btn01.png" alt="내용보기"/></a>
								<br>
								<input type="checkbox" id="agreeAdvts02" name="agreeAdvts" checked="checked" /><label for="agreeAdvts02"><img src="/pc/images/db2_text06.png?20200309183007" style="top: 1px;" alt="광고성 정보수신동의"></label>
								<br>
								<input type="checkbox" id="agreeThird02" name="agreeThird" checked="checked" /><label for="agreeThird02"><img src="/pc/images/db2_text07.png?20200514183007" style="top: 3.5px;" alt="제3자제공및활용동의"></label>
								<a href="#" data-role="open_popup" data-send="popup_agree" style="top: 1px;" ><img src="/pc/images/db2_btn01.png" alt="내용보기"/></a>
							</div>
<%--							<div class="area04">--%>
<%--								<input type="checkbox" id="agreeThird02" name="agreeThird" checked="checked" /><label for="agreeThird02"><img src="/pc/images/db_text08.png?20200309183007" style="top: 0px;" alt="제3자제공및활용동의"></label>--%>
<%--							</div>--%>

							<div class="btn">
								<a href="javascript:void(0);"><img class="insertDb" src="/pc/images/db2_btn02.png?20191127180005" alt="가격 확인"/></a>
								<a href="javascript:void(0);"><img class="insertDb" src="/pc/images/db2_btn03.png?20191126184108" alt="전문 상담원 연결"/></a>
							</div>
						</div>
						<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- // contents -->
	
	<div class="footer">
		<div class="inner">
			<address>	
				종근당건강㈜ㅣ대표이사: 김호곤ㅣ사업자등록번호 134-81-29992ㅣ통신판매업신고번호: 제2010-충남당진-0063호ㅣ건강기능식품판매업 제2005-74호<br/>
				충청남도 당진시 송악읍 복운1길 30ㅣ개인정보관리자: 정문수ㅣ고객콜센터: 1811-1478
			</address>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/layerPopup.jsp"%>
</body>
</html>

















