<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, admin-scalable=no, target-densitydpi=medium-dpi" />
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<%@ include file="/WEB-INF/views/common/trackingTag.jsp"%>
<%-- 2020.04.16 팝업 삭제 요청 --%>
<%--<%@ include file="/WEB-INF/views/common/popup.jsp"%>--%>
<%@ include file="/WEB-INF/views/common/showget.jsp"%>
</head>
<body>
<div id="wrap">
	<div class="header">
		<h1><img src="/mobile/images/header.gif" alt="종근당건강 건강기능식품 천관보"/></h1>
		<a href="tel:1811-1478">1:1 실시간 무료 상담 1811-1478</a>
	</div>

	<div class="banner">
		<div class="inner">
			<img src="/mobile/images/top_banner01.jpg" alt="천관보는 KBS 드라마 '한 번 다녀왔습니다' 와 함께합니다."/>
			<div class="hide">

			</div>
		</div>
	</div>

	<div class="contents">
		<div class="kv">
			<div class="inner">
				<p><img src="/mobile/images${repository}/kv_img01.gif?20200312181030" alt="관절&연골 건강에는? 365일 관절 대들보 종근당건강 천관보"></p>
				<div class="input_area">
                    <p><img src ="/mobile/images/db_text07.png?20191129122505"></p>
					<form id="frmDb_rightTop">
						<div class="cont">
							<div class="area01">
								<div class="name">
									<label for="userName"><img src="/mobile/images/db_text01.png?20191129122505" alt="성함"></label>
									<input type="text" name="userName" id="userName" placeholder="예) 홍길동" />
								</div>
								<div class="age">
									<label for="userAge"><img src="/mobile/images/db_text04.png" alt="상담내용"></label>
									<input type="text" class="numbersOnly" name="userAge" id="userAge" placeholder="예) 56" maxlength="2" title="나이" />
									<span><img src="/mobile/images/db_text04_a.png?20191129122505" alt="세"></span>
								</div>
                                <div class="sex">
                                    <label><img src="/mobile/images/db_text06.png?20191129122505" alt="성별"></label>
                                    <input type="radio" id="gender-men01" name="gender" value="남" checked="checked">
                                    <label for="gender-men01">남</label>
                                    <input type="radio" id="gender-women01" name="gender" value="여">
                                    <label for="gender-women01">여</label>
                                </div>
							</div>

							<div class="area02">
								<div class="mobile">
									<label for="userMobile"><img src="/mobile/images/db_text02.png?20191129122505" alt="연락처"></label>
									<input type="text" class="numbersOnly" name="userMobile" id="userMobile" placeholder="예) 01012345678" maxlength="11" />
								</div>
								<div class="consult">
									<label for="userConsult"><img src="/mobile/images/db_text03.png" alt="상담내용"></label>
									<input type="text" name="userConsult" id="userConsult" placeholder="(선택 사항)" />
								</div>
							</div>

							<div class="area03">
								<input type="checkbox" name="agree" id="agree01" checked="checked" /><label for="agree01"><img src="/mobile/images/db_text05.png" alt="개인정보취급동의"></label>
								<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>
							</div>
							<div class="area04">
								<input type="checkbox" name="agreeAdvts" id="agreeAdvts01" checked="checked" /><label for="agreeAdvts01"><img src="/mobile/images/db_text08.png?20200309183007" alt="광고성 정보(이메일, 전화, 문자)를 수신하는데 동의합니다"></label>
							</div>
							<div class="area05">
								<input type="checkbox" name="agreeThird" id="agreeThird01" checked="checked" /><label for="agreeThird01"><img src="/mobile/images/db_text09.png?20200514183007" alt="제 3자 제공 및 활용 동의합니다"></label>
								<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>
							</div>

							<div class="btn">
								<a href="javascript:void(0);"><img class="insertDb" src="/mobile/images/db_btn02.png?20191129122505" alt="가격 확인"/></a>
								<a href="javascript:void(0);"><img class="insertDb" src="/mobile/images/db_btn03.png?20191129122505" alt="전문 상담원 연결"/></a>
							</div>
						</div>
						<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>
					</form>
				</div>
			</div>
		</div>

		<div class="s01">
			<div class="inner">
				<img src="/mobile/images/s01_img01.gif?20191226155430" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s02">
			<div class="inner">
				<img src="/mobile/images/s02_img01.gif?20191226155430" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s03">
			<div class="inner">
				<img src="/mobile/images/s03_img01.gif?20191226155430" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>
		
		<div class="s04">
			<div class="inner">
				<img src="/mobile/images/s04_img01.gif?20200312181030" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s05">
			<div class="inner">
				<img src="/mobile/images/s05_img01.gif?20191226155430" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s06">
			<div class="inner">
				<img src="/mobile/images/s06_img01.gif?20191226155430" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>

		<div class="s07">
			<div class="inner">
				<img src="/mobile/images/s07_img01.gif?20191226155430" alt="하단문구참조"/>
				<div class="hide">
					
				</div>
			</div>
		</div>
		<div class="footer">
			<p class="inner">
			<address>
				종근당건강㈜<br>
				대표이사: 김호곤 | 사업자등록번호 134-81-29992<br>
				통신판매업신고번호: 제2010-충남당진-0063호<br>
				건강기능식품판매업 제20005-74호<br>
				충청남도 당진시 송악읍 복운1길 30<br>
				개인정보관리자: 정문수 | 고객콜센터: 1811-1478
			</address>
			</p>
		</div>
		<!-- float-->
		<form id="frmDb_floating">
			<div id="floating" >
				<div class="input_area">
					<div class="cont">
						<div class="area01">
							<div class="name">
								<label for="userName2"><img src="/mobile/images/db_text01.png?20191129122505" alt="성함"></label>
								<input type="text" name="userName" id="userName2" placeholder="예) 홍길동" />
							</div>
							<div class="age">
								<label for="userAge2"><img src="/mobile/images/db_text04.png" alt="상담내용"></label>
								<input type="text" class="numbersOnly" name="userAge" id="userAge2" placeholder="예) 56" maxlength="2" title="나이" />
								<span><img src="/mobile/images/db_text04_a.png" alt="세"></span>
							</div>
							<div class="sex">
								<label><img src="/mobile/images/db_text06.png?20191129122505" alt="성별"></label>
								<input type="radio" id="gender-men02" name="gender" value="남" checked="checked">
								<label for="gender-men02">남</label>
								<input type="radio" id="gender-women02" name="gender" value="여">
								<label for="gender-women02">여</label>
							</div>
						</div>


						<div class="area02">
							<div class="mobile">
								<label for="userMobile2"><img src="/mobile/images/db_text02.png?20191129122505" alt="연락처"></label>
								<input type="text" class="numbersOnly" name="userMobile" id="userMobile2" placeholder="예) 01012345678" maxlength="11" />
							</div>
							<div class="consult">
								<label for="userConsult2"><img src="/mobile/images/db_text03.png" alt="상담내용"></label>
								<input type="text" name="userConsult" id="userConsult2" placeholder="(선택 사항)"/>
							</div>
						</div>

						<div class="area03">
							<input type="checkbox" name="agree" id="agree02" checked="checked" /><label for="agree02"><img src="/mobile/images/db_text05.png" alt="개인정보취급동의"></label>
							<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>
						</div>
						<div class="area04">
							<input type="checkbox" name="agreeAdvts" id="agreeAdvts02" checked="checked" /><label for="agreeAdvts02"><img src="/mobile/images/db_text08.png?20200309183007" alt="광고성 정보(이메일, 전화, 문자)를 수신하는데 동의합니다"></label>
						</div>
						<div class="area05">
							<input type="checkbox" name="agreeThird" id="agreeThird02" checked="checked" /><label for="agreeThird02"><img src="/mobile/images/db_text09.png?20200309183007" alt="제 3자 제공 및 활용 동의합니다"></label>
							<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>
						</div>
					</div>

					<div class="btn">
						<a id="" href="javascript:void(0);"><img src="/mobile/images/float_btn_down.png" alt="닫기"></a>
					</div>

				</div>

				<div class="inner default">
					<ul>
						<li><a href="javascript:void(0);" class="btn01"><img src="/mobile/images/float_btn01_off.png?20191129122505" alt="상담원 연결하기"></a></li>
						<li><a href="javascript:void(0);" class="btn02"><img src="/mobile/images/float_btn02_off.png?20191129122505" alt="가격 확인하기"></a></li>
					</ul>
				</div>

				<div class="inner active">
					<ul>
						<li class="active01">
							<a href="javascript:void(0);" class="btn01">
								<img class="insertDb" src="/mobile/images/float_btn01_on.png?20191129122505" alt="상담원 연결하기">
								<div class="sc-loaders">
									<div class="s-spinners">
										<div class="s-bounce1"></div>
										<div class="s-bounce2"></div>
										<div class="s-bounce3"></div>
									</div>
								</div>
							</a>
						</li>
						<li class="active02">
							<a href="javascript:void(0);" class="btn02">
								<img class="insertDb" src="/mobile/images/float_btn02_on.png?20191129122505" alt="가격 확인하기">
								<div class="sc-loaders">
									<div class="s-spinners">
										<div class="s-bounce1"></div>
										<div class="s-bounce2"></div>
										<div class="s-bounce3"></div>
									</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>
		</form>
		<!-- // float -->
	</div>
	<!-- // contents -->
</div>
<%@ include file="/WEB-INF/views/common/layerPopup.jsp"%>
</body>
</html>


