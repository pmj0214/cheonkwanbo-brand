<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=750">
	<meta name="description" content="">
	<meta name="author" content="">
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<script type="text/javascript" src="mobile/js/jquery.swipe.min.js"></script>
	<%--<%@ include file="/WEB-INF/views/common/trackingTag.jsp"%>--%>

	<%--[if lt IE 9]--%>
	<%--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--%>
	<%--<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--%>
	<%--[endif]--%>

	<script type="text/javascript">
		$(function(){
			$('.btn-save').click(function(){
				var t = $(this).attr('t');
				if($(t+' input[name="userName"]').val() == '') { $(t+' input[name="userName"]').focus(); return; }
				if($(t+' input[name="userAge"]').val() == '') { $(t+' input[name="userAge"]').focus(); return; }
				if($(t+' input[name="userMobile"]').val() == '') { $(t+' input[name="userMobile"]').focus(); return; }
				if(!$(t+' input[name="agree"]').is(':checked')) { alert('개인정보 수집에 동의가 필요합니다.'); return; }
				if(!$(t+' input[name="agree2"]').is(':checked')) { alert('제3자 제공 및 활용 동의가 필요합니다.'); return; }
				if(!$(t+' input[name="agree3"]').is(':checked')) { alert('광고성 정보(이메일, 전화, 문자)를 수신하는데 동의가 필요합니다.'); return; }
				var data = {
					'code':"DEFAULT",'url':"CHEONKWANBO",'device':"MO"
					,'userName':$(t+' input[name="userName"]').val(),'userAge':$(t+' input[name="userAge"]').val(),'gender':$(t+' input[name="gender"]').val(),'userMobile':$(t+' input[name="userMobile"]').val()
					,'userConsult':$(t+' input[name="userConsult"]').val(), 'agree':$(t+' input[name="agree"]').val(), 'agree2':$(t+' input[name="agree2"]').val(), 'agree3':$(t+' input[name="agree3"]').val()
					,'r_referer' : $(t+' input[name="referer"]').val()
					,'utm_source' : $(t+' input[name="utm_source"]').val()
					,'utm_campaign' : $(t+' input[name="utm_campaign"]').val()
					,'utm_content' : $(t+' input[name="utm_content"]').val()
					,'utm_group' : $(t+' input[name="utm_group"]').val()
					,'utm_medium' : $(t+' input[name="utm_medium"]').val()
					,'utm_term' : $(t+' input[name="utm_term"]').val()
				};

				console.log(data);
				$.ajax({
					type: "POST", url: "/consultDB", data: data,
					success: function(res) {
						switch(res.statusMsg){
							case 'error': alert('정보가 정확하지 않습니다. 잠시후 다시 해주세요.'); break;
							case 'oneDayDuplicate': alert('이미 등록이 된 정보 입니다.'); break;
							case 'success':
								alert('정보 등록이 완료되었습니다.\n감사합니다.');
								break;
							case 'oneMinIp': alert('[천관보]를 사랑해주시는 고객님 감사합니다.\n무분별한 상담신청 방지정책에 따라 동일IP에서 1분 이내에 여러건의 상담신청을 하실 수 없습니다.\n추가적인 상담신청은 1분 후 작성 가능합니다.'); break;
							default: console.log(res); break;
						}
						$('.btn-save').css('visibility', 'visible');
					},
					error : function(res){	console.log(res); }
				});
			});


			//header animation
			setInterval(function(){
				$('.himg1').toggle();
				$('.himg2').toggle();
			},500)
		});

		$(function(){
			$('#page9 .al, #page9 .ar').click(function(){
				var dir = 1;
				if($(this).hasClass('al')) dir = -1;
				var no = parseInt($('#page9 .slide').attr('no'));
				no += dir;
				if(no < 0) no = $('#page9 .slide .item').length -1;
				else if(no >= $('#page9 .slide .item').length) no = 0;
				$('#page9 .slide').attr('no', no);
				$('#page9 .slide-in').css('left', -$('#page9 .slide').width()*no+'px');
			});
		});

		var didScroll;
		var lastScrollTop = 0;
		var delta = 5;
		var fade_height = 7300;
		var navbarHeight = $('header').outerHeight();

		$(window).scroll(function(event){
			didScroll = true;
		});

		setInterval(function() {
			if (didScroll) { hasScrolled();didScroll = false; } }, 250
		);
		function hasScrolled() {
			var st = $(this).scrollTop();

			console.log(st,lastScrollTop);

			// Make sure they scroll more than delta
			if(Math.abs(lastScrollTop - st) <= delta)
				return;

			// If they scrolled down and are past the navbar, add class .nav-up.
			// This is necessary so you never see what is "behind" the navbar.
			if (st + $(window).height() < 7500){
				// Scroll Down
				$('.fixed.goto').fadeIn(150)
			} else {
				// Scroll Up
				if(st > 7300) {
					$('.fixed.goto').fadeOut(150)
				}
			}
			lastScrollTop = st;
		}


		$('.goto[no]').click(function(){
			goto(parseInt($(this).attr('no')));
			if ($(this).attr('no')=='pagedb')
			{
				$('.popup2').hide();
			}
		});

	</script>

	<style>
		.head .btn2 {width: 223px; height: 159px;}
		.head .himg2 {display: none;}

		#page1 {margin-top: 182px;}

		#page9 {background-color: #3c1d19; width: 100%; max-width: none;}
		#page9 .slide {position: absolute; z-index: 2; left: 50%; top: 140px; transform: translateX(-50%); width:95%; overflow: hidden; }
		#page9 .slide .slide-in { display: table; white-space: nowrap; transition: left .3s; position: relative; left: 0; }
		#page9 .slide .item {display: inline-block; vertical-align: text-top; }
		#page9 .al {top:50%;left: 5%; width: 39px;position: absolute; z-index: 10;}
		#page9 .ar {top:50%;right: 5%; width: 39px;position: absolute; z-index: 10;}
		.fixed {position: fixed; z-index: 1000; bottom: 32px; right: 30px; cursor: pointer; }

	</style>
</head>
<body>
	<div class="overlay">
		<div class="block">
			<div class="btn"><i class="material-icons close">close</i></div>
			<h2>개인정보 취급방침</h2>
			<b>종근당건강(주)</b> (이하 “회사”)는 고객의 개인정보를 중요시 하며, 『정보통신망이용 촉진 및 정보 보호 등에 관한 법률 』 상의 개인정보보호 규정 및 정보통신부가 제정한 『 개인정보보호 및 취급방침』을 준수하고 있습니다. 회사는 개인정보취급방침을 통해 아래와 같이 제공해주시는 개인정보의 수집 및 이용목적과 개인정보보호를 위한 회사의 조치 사항을 고지합니다.<br>
			<br>
			<b>1. 개인정보 수집 이용 제공 등에 대한 동의</b><br>
			회사는 고객이 회사가 제공하는 안내 및 상담신청에 귀하가 제공한 정보는 개인정보취급방침에 명시된 내용 이외의 목적으로는 사용되지 아니합니다.<br>
			<br>
			<b>2. 수집하는 개인정보의 범위 및 수집방법</b><br>
			회사에서는 귀하의 상담신청 및 서비스신청 등을 위한 필수적인 정보를 입력 받고 있습니다. <br>
			- 필수정보 : 성명, 나이, 전화번호<br>
			- 선택정보 : 문의사항, 성별, 설문사항 등<br>
			- 서비스 이용과정이나 처리 과정에서 자동으로 생성되어 수집될 수 있는 정보 : IP Address, 참여일시, 유입경로(참여매체), 쿠키, 방문 일시, 서비스 이용 기록, 이용 정지 기록, 결제 기록 등<br>
			- 용역 및 재화의 주문 시 수집정보 : <br>
			&nbsp;&nbsp;① 신용카드 결제 시 : 카드사명, 카드번호 등 결제를 위한 정보<br>
			&nbsp;&nbsp;② 무통장 입금 및 인터넷 뱅킹 시 : 은행 명, 입금자명 등<br>
			- 신용카드결제, 계좌이체 및 가상계좌는 케이에스넷, 엘지유플러스 결제 대행서비스를 이용하고 있습니다. <br>
			- 정보 제공을 위한 수집정보 : 성명, 이메일 주소, 전화번호 등 정보제공을 위한 정보<br>
			- 이벤트 및 상담을 위한 수집정보 : 성명, 이메일 주소, 전화번호, 성별, 생년월일, 마케팅 정보 수신동의<br>
			- 청구서, 상품 배송지 확인을 위한 수집정보 : 성명, 전화번호, 우편물 수령지(자택 및 직장주소)<br>
			&nbsp;&nbsp;(본인 이외의 타인에게 직접 배송을 요청할 경우 이름, 주소, 연락처 등 배송에 필요한 개인 식별 정보를 수집하는 것에 대하여 동의합니다.)<br>
			<br>
			<b>3. 개인정보의 수집 및 이용목적</b><br>
			입력하신 정보는 개인별 맞춤 서비스 제공, 이벤트 안내(이메일, 전화, MMS 등), 상품안내를 위한 마케팅 자료(전화, 이메일, MMS 등)로 활용 됩니다.<br>
			<br>
			<b>4. 개인정보의 보유 및 이용기간</b><br>개인정보를 수집 동의일로부터 5년간 보유 및 활용하게 되고, 위 보유기간의 경과 즉시 기록을 재생할 수 없는 기술적 방법을 사용하여 동 개인정보를 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br>
			&lt; 관련법령에 의한 정보보유 사유  &gt; <br>
			- 계약 또는 청약철회 등에 관한 기록 : 5년<br>
			- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 <br>
			- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
			<br>
			<b>5. 개인정보의 파기절차 및 방법</b>
			원칙적으로, 개인정보 수집 및 이용목적이 달성되거나, 개인정보 보유 및 이용기간이 종료한 경우 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br>
			&lt; 파기절차 &gt; <br>
			귀하가 참여한 고객정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정기간 저장된 후 파기됩니다. 동 개인정보는 법률에 의한 경우가 아니고서는 보유 이외의 다른 목적으로 이용되지 않습니다.<br>
			&lt; 파기방법 &gt; <br>
			- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고<br>
			- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br>
			<br>
			<b>6. 개인정보 수집 이용 제공 등에 대한 동의철회</b><br>
			귀하는 개인정보의 수집 이용 제공에 대한 동의를 본인 및 법정대리인을 통해 철회할 수 있습니다. 동의철회는 명시된 문의전화 또는 이메일 등을 통해 가능합니다.<br>
			<br>
			<b>7. 개인정보의 제 3자 제공 및 취급위탁</b><br>
			회사는 귀하의 개인정보를 &lt;개인정보의 수집목적 및 이용목적&gt;에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업, 기관에 제공하지 않습니다. 그러나 보다 나은 서비스 제공을 위하여 필요할 경우, 귀하의 개인정보를 제휴사에게 제공하거나 또는 제휴사와 공유할 수 있습니다. 개인정보를 제공하거나 공유할 경우에는 사전에 귀하의 동의를 구하는 절차를 거치게 됩니다.
			다음은 예외로 합니다. <br>
			관계법령에 의하여 수사상의 목적으로 관계기관으로부터의 요구가 있을 경우입니다. 제휴관계에 변화가 있거나 제휴관계가 종결될 때도 같은 절차에 의하여 고지하거나 동의를 구합니다. <br>
			통계작성/학술연구나 시장조사를 위하여 특정 개인을 식별할 수 없는 형태로 광고주/협력 사나 연구단체 등에 제공하는 경우 <br>
			위탁 처리 : 원활한 업무 처리를 위해 이용자의 개인정보를 위탁 처리할 경우 반드시 사전에 위탁처리 업체명과 위탁 처리되는 개인정보의 범위, 업무위탁 목적, 위탁 처리되는 과정, 위탁관계 유지기간 등에 대해 상세하게 고지합니다. <br>
			그러나 예외 사항에서도 관계법령에 의하거나 수사기관의 요청에 의해 정보를 제공한 경우에는 이를 당사자에게 고지하는 것을 원칙으로 운영하고 있습니다. 법률상의 근거에 의해 부득이하게 고지를 하지 못할 수도 있습니다. 본래의 수집목적 및 이용목적에 반하여 무분별하게 정보가 제공되지 않도록 최대한 노력하겠습니다.<br>
			<br>
			<br>
			<b>8. 개인정보 처리 업무의 위탁</b><br>
			가. 회사는 기본적인 서비스 제공, 더 나은 서비스 제공, 고객편의 제공 등 원활한 업무 수행을 위하여 다음과 같이 개인정보 처리 업무를 외부전문업체에 위탁하여 운영하고 있습니다.<br>
			<table cellspacing="0" cellpadding="5&quot;" border="1" align="center" style="width:100%;border-collapse: collapse; border: 1px gray solid;">
				<tbody>
				<tr>
					<th style="width: 30%">수탁자</th><th style="width: 40%">위탁사무 및 목적</th><th style="width: 30%">보유 및 이용기간</th>
				</tr>
				<tr>
					<td>텔레인싸이트</td>
					<td>
						회원 정보 DB시스템 유지보수<br>
						고객 통화, 이메일, 문자메시지 발송<br>
						제품의 상담 및 판매, 배송 등의 전반<br>
						고객상담 및 불만처리 업무 전반<br>
					</td>
					<td>고객동의 철회 또는 위탁 계약 만료 때 까지</td>
				</tr>
				<tr>
					<td>㈜텔라이프</td>
					<td>
						회원 정보 DB시스템 운영/관리 업무<br>
						고객 통화, 이메일, 문자메시지 발송<br>
						제품의 상담 및 판매, 배송 등의 전반<br>
						고객상담 및 불만처리 업무 전반<br>
					</td>
					<td>고객동의 철회 또는 위탁 계약 만료 때 까지</td>
				</tr>
				<tr>
					<td>대한통운</td>
					<td>
						주문 상품의 배송
					</td>
					<td>고객동의 철회 또는 위탁 계약 만료 때 까지</td>
				</tr>
				<tr>
					<td>㈜케이에스넷<br>㈜엘지유플러스</td>
					<td>
						본인인증(금융거래, 금융서비스)<br>
						결제대행<br>
					</td>
					<td>고객동의 철회 또는 위탁 계약 만료 때 까지</td>
				</tr>
				</tbody>
			</table>
			나. 회사는 위탁업무계약서 등을 통하여 개인정보보호 관련 법규의 준수, 개인정보에 관한 비밀유지, 개인정보의 제3자 제공 금지, 사고시의 책임 부담, 위탁기간, 처리 종료 후의 개인정보의 반환 또는 파기의무 등을 규정하고, 이를 지키도록 관리하고 있습니다.<br>
			<br>
			<b>9. 개인정보관리책임자 및 민원서비스</b><br>
			귀하의 개인정보를 보호하고 관련한 불만을 처리하기 위하여 회사는 개인정보관리책임자를 두어 귀하의 개인정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 귀하께 고지한 사항들에 반하는 사고가 발생할 시에 개인정보관리책임자가 모든 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종 분쟁에 관해서는 책임이 없습니다. 고객님의 개인정보를 처리하는 책임자 및 담당자는 다음과 같으며 개인정보 관련 문의사항에 신속하고 성실하게 답변해드리고 있습니다.<br>
			[개인정보관리책임자]<br>
			성 명 : 김용철<br>
			직 위 : 이사<br>
			연락처 : 02-6292-9213 <br>
			팩스번호 : 02-572-0011 <br>
			이메일 : yckim@ckdhc.com<br>
			[개인정보 관리자] <br>
			부서명 : 경영지원팀<br>
			성 명 : 정문수<br>
			직 위 : 차장<br>
			연락처 : 02-6292-9110<br>
			팩스번호 : 02-572-0011 <br>
			이메일: jms8676@ckdhc.com  <br>
			- 정보주체 께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 관리책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다. <br>
			- 정보주체는 개인정보 보호법 제35조 및 정보통신망법 제30조에 따른 개인정보의 열람 청구를 관련 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.<br>
			<b>10. 개인정보 열람청구</b><br>
			정보주체는 개인정보 보호법 제35조 및 정보통신망법 제30조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.<br>
			<br>
			가. 개인정보 열람청구 접수ㆍ처리 부서<br>
			[개인정보 관리자] <br>
			성  명 : 정문수<br>
			직  위 : 차장<br>
			연락처 : 02-6292-9110<br>
			팩스번호 : 02-572-0011<br>
			이메일 : jms8676@ckdhc.com<br>
			<br>
			<b>11. 만 14 세 미만 아동의 개인정보보호</b><br>
			회사는 법정 대리인의 동의가 필요한 만 14세 미만 아동의 회원 가입은 받고 있지 않습니다.<br>
			<b>12. 권익침해 구제방법</b><br>
			정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다. [아래의 기관은 회사와는 별개의 기관으로서, 회사의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다]<br>
			<br>
			가. 개인정보보호 종합지원 포털 (행정안전부 운영)<br>
			소관업무 : 개인정보 침해사실 신고, 상담 신청, 자료제공<br>
			홈페이지 : www.privacy.go.kr<br>
			전화 : 02-2100-3394<br>
			<br>
			나. 개인정보 침해신고센터 (한국인터넷진흥원 운영)<br>
			소관업무 : 개인정보 침해사실 신고, 상담 신청<br>
			홈페이지 : privacy.kisa.or.kr<br>
			전화 : (국번없이) 118 - 주소 : (138-950) 서울시 송파구 중대로135 한국인터넷진흥원 개인정보침해신고센터<br>
			<br>
			다. 개인정보 분쟁조정위원회 (한국인터넷진흥원 운영)<br>
			소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br>
			홈페이지 : privacy.kisa.or.kr<br>
			전화 : (국번없이) 118 - 주소 : (138-950) 서울시 송파구 중대로135 한국인터넷진흥원 개인정보침해신고센터<br>
			<br>
			라. 경찰청 사이버테러대응센터<br>
			소관업무 : 개인정보 침해 관련 형사사건 문의 및 신고<br>
			홈페이지 : www.netan.go.kr<br>
			전화 : (사이버범죄) 02-393-9112 (경찰청 대표) 1566-0112<br>
			<br>
			<b>13. 개인정보관리책임자 및 민원서비스</b><br>
			이 개인정보처리방침은 2017 년 06월 14 일 에 제정되었으며 법령/정책 또는 보안기술의 변경에 따라 내용의 추가 및 삭제 및 수정이 있을 시에는 변경되는 개인정보처리방침을 시행하기 최소 15일전에 해당 품목별 인터넷페이지를 통해 내용 등을 공지하도록 하겠습니다.<br>
			<br>
			- 개인정보처리방침 시행일자 : 2017-07-03<br>
			<h2></h2>        <div class="btn"><i class="material-icons close">close</i></div>
		</div>
	</div>

	<div class="fixed goto" no="pagedb">
		<a href="#pagedb"><img src="/mobile/images/banner_01.png" alt="1877-1478 빠른주문상담가기"></a>
	</div>

	<div class="head">
		<div class="in">
			<img class="himg1" src="/mobile/images/header-m1_191119.png" style="display: inline;">
			<img class="himg2" src="/mobile/images/header-m2_191119.png" style="display: none;">
		</div>
		<a class="btn2" href="tel:1811-1478"></a>
	</div>
	<div class="page" id="page1">
		<div class="in"><img src="/mobile/images/page1_191119.jpg"></div>
	</div>
	<div class="page" id="page2" no="2">
		<div class="in">
			<img src="/mobile/images/page2_191119.jpg">
		</div>
	</div>
	<div class="page" id="page3" no="3">
		<div class="in"><img src="/mobile/images/page3_191119.jpg"></div>
	</div>
	<div class="page" id="page4" no="4">
		<div class="in"><img src="/mobile/images/page4_191119.jpg"></div>
	</div>
	<div class="page" id="page5" no="5">
		<div class="in">
			<img src="/mobile/images/page5_191119.jpg">
		</div>
	</div>
	<div class="page" id="page6" no="6">
		<div class="in"><img src="/mobile/images/page6_191119.jpg"></div>
	</div>
	<div class="page" id="page7" no="7">
		<div class="in"><img src="/mobile/images/page7_191119.jpg"></div>
	</div>
	<div class="page" id="page8" no="8">
		<div class="in"><img src="/mobile/images/page8_191119.jpg"></div>
	</div>
	<div class="page" id="page9" no="9">
		<div class="in">
			<img src="/mobile/images/page9_191126.png">
			<div class="slide" no="0">
				<div class="slide-in">
					<div class="item"><img src="/mobile/images/page9-1_191126.png"></div>
					<div class="item"><img src="/mobile/images/page9-2_191126.png"></div>
					<div class="item"><img src="/mobile/images/page9-3_191126.png"></div>
				</div>
			</div>
			<div class="al"><img src="/mobile/images/page9-al.png"></div>
			<div class="ar"><img src="/mobile/images/page9-ar.png"></div>
		</div>
	</div>
	<div class="page" id="pagedb">
		<div class="in">
			<img src="/mobile/images/page12.png">
			<table class="apply" id="apply" cellpadding="0" cellspacing="0">
				<input type="hidden" name="gender" value="M">
				<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>
				<tbody><tr>
					<td class="n">ㆍ성명</td><td class="v"><input type="text" class="input" name="userName"></td>
				</tr>
				<tr>
					<td class="n">ㆍ전화번호</td><td class="v"><input type="text" class="input" name="userMobile"></td>
				</tr>
				<tr>
					<td class="n">ㆍ성별</td>
					<td class="v">
						<a class="radio on" name="gender" value="M">남자</a>
						<a class="radio" name="gender" value="F">여자</a>
					</td>
				</tr>
				<tr>
					<td class="n">ㆍ나이</td><td class="v"><input type="text" class="input" name="userAge"></td>
				</tr>
				<tr>
					<td class="n">ㆍ상담내용</td><td class="v"><input type="text" class="input" name="userConsult"></td>
				</tr>
				<!--<tr>
					<td colspan=2 class="n">ㆍ불편한 부위<span>(어깨,손,목,무릎,허리 기타)</span></td>
				</tr>
				<tr>
					<td colspan=2 class="n2"><input type="text" class="input" name="goal"/></td>
				</tr>-->
				<tr>
					<td colspan="2" class="agree n" align="center">
						<label>개인정보취급동의 <span class="show-agree">[자세히보기]</span> 동의합니다 <input type="checkbox" name="agree" value="Y" checked=""></label>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="agree n" align="center">
						<label>제3자 제공 및 활용 동의합니다 <input type="checkbox" name="agree2" value="Y" checked=""></label>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="agree n" align="center">
						<label>광고성 정보(이메일, 전화, 문자)를 수신하는데 동의합니다.<input type="checkbox" name="agree3" value="Y" checked=""></label>
					</td>
				</tr>
				<tr>
					<td colspan="2"><center><a class="btn btn-save" t="#apply">상담 신청하기</a></center></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<b>종근당건강(주)</b> | 대표이사 : 김호곤 | 사업자등록번호 134-81-29992<br>
			건강기능식품광고심의필 : 190110362<br>
			통신판매업신고번호 : 제 2010-충남당진-0063호 <a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank">[사업자정보확인]</a><br>
			건강기능식품판매업 : 제2005-74호 | 충청남도 당진시 송악읍 복운1길 30<br>
			고객콜센터 : 1644-8863 | 개인정보관리자 : 정문수<br>
			Copyright ⓒ 2019 천관보 All right reserved.<br>

		</div>
	</div>








<%--<div id="wrap">--%>
<%--	<div class="header">--%>
<%--		<h1><img src="/mobile/images/header.gif" alt="종근당건강 건강기능식품 천관보"/></h1>--%>
<%--		<a href="tel:1811-1478">1:1 실시간 무료 상담 1811-1478</a>--%>
<%--	</div>--%>

<%--	<div class="banner">--%>
<%--		<div class="inner">--%>
<%--			<img src="/mobile/images/top_banner01.jpg" alt="천관보는 KBS 드라마 '한 번 다녀왔습니다' 와 함께합니다."/>--%>
<%--			<div class="hide">--%>

<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

<%--	<div class="contents">--%>
<%--		<div class="kv">--%>
<%--			<div class="inner">--%>
<%--				<p><img src="/mobile/images${repository}/kv_img01.gif?20200312181030" alt="관절&연골 건강에는? 365일 관절 대들보 종근당건강 천관보"></p>--%>
<%--				<div class="input_area">--%>
<%--                    <p><img src ="/mobile/images/db_text07.png?20191129122505"></p>--%>
<%--					<form id="frmDb_rightTop">--%>
<%--						<div class="cont">--%>
<%--							<div class="area01">--%>
<%--								<div class="name">--%>
<%--									<label for="userName"><img src="/mobile/images/db_text01.png?20191129122505" alt="성함"></label>--%>
<%--									<input type="text" name="userName" id="userName" placeholder="예) 홍길동" />--%>
<%--								</div>--%>
<%--								<div class="age">--%>
<%--									<label for="userAge"><img src="/mobile/images/db_text04.png" alt="상담내용"></label>--%>
<%--									<input type="text" class="numbersOnly" name="userAge" id="userAge" placeholder="예) 56" maxlength="2" title="나이" />--%>
<%--									<span><img src="/mobile/images/db_text04_a.png?20191129122505" alt="세"></span>--%>
<%--								</div>--%>
<%--                                <div class="sex">--%>
<%--                                    <label><img src="/mobile/images/db_text06.png?20191129122505" alt="성별"></label>--%>
<%--                                    <input type="radio" id="gender-men01" name="gender" value="남" checked="checked">--%>
<%--                                    <label for="gender-men01">남</label>--%>
<%--                                    <input type="radio" id="gender-women01" name="gender" value="여">--%>
<%--                                    <label for="gender-women01">여</label>--%>
<%--                                </div>--%>
<%--							</div>--%>

<%--							<div class="area02">--%>
<%--								<div class="mobile">--%>
<%--									<label for="userMobile"><img src="/mobile/images/db_text02.png?20191129122505" alt="연락처"></label>--%>
<%--									<input type="text" class="numbersOnly" name="userMobile" id="userMobile" placeholder="예) 01012345678" maxlength="11" />--%>
<%--								</div>--%>
<%--								<div class="consult">--%>
<%--									<label for="userConsult"><img src="/mobile/images/db_text03.png" alt="상담내용"></label>--%>
<%--									<input type="text" name="userConsult" id="userConsult" placeholder="(선택 사항)" />--%>
<%--								</div>--%>
<%--							</div>--%>

<%--							<div class="area03">--%>
<%--								<input type="checkbox" name="agree" id="agree01" checked="checked" /><label for="agree01"><img src="/mobile/images/db_text05.png" alt="개인정보취급동의"></label>--%>
<%--								<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>--%>
<%--							</div>--%>
<%--							<div class="area04">--%>
<%--								<input type="checkbox" name="agreeAdvts" id="agreeAdvts01" checked="checked" /><label for="agreeAdvts01"><img src="/mobile/images/db_text08.png?20200309183007" alt="광고성 정보(이메일, 전화, 문자)를 수신하는데 동의합니다"></label>--%>
<%--							</div>--%>
<%--							<div class="area05">--%>
<%--								<input type="checkbox" name="agreeThird" id="agreeThird01" checked="checked" /><label for="agreeThird01"><img src="/mobile/images/db_text09.png?20200514183007" alt="제 3자 제공 및 활용 동의합니다"></label>--%>
<%--								<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>--%>
<%--							</div>--%>

<%--							<div class="btn">--%>
<%--								<a href="javascript:void(0);"><img class="insertDb" src="/mobile/images/db_btn02.png?20191129122505" alt="가격 확인"/></a>--%>
<%--								<a href="javascript:void(0);"><img class="insertDb" src="/mobile/images/db_btn03.png?20191129122505" alt="전문 상담원 연결"/></a>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>--%>
<%--					</form>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="s01">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s01_img01.gif?20191226155430" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="s02">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s02_img01.gif?20191226155430" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="s03">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s03_img01.gif?20191226155430" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		--%>
<%--		<div class="s04">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s04_img01.gif?20200312181030" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="s05">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s05_img01.gif?20191226155430" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="s06">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s06_img01.gif?20191226155430" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="s07">--%>
<%--			<div class="inner">--%>
<%--				<img src="/mobile/images/s07_img01.gif?20191226155430" alt="하단문구참조"/>--%>
<%--				<div class="hide">--%>
<%--					--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="footer">--%>
<%--			<p class="inner">--%>
<%--			<address>--%>
<%--				종근당건강㈜<br>--%>
<%--				대표이사: 김호곤 | 사업자등록번호 134-81-29992<br>--%>
<%--				통신판매업신고번호: 제2010-충남당진-0063호<br>--%>
<%--				건강기능식품판매업 제20005-74호<br>--%>
<%--				충청남도 당진시 송악읍 복운1길 30<br>--%>
<%--				개인정보관리자: 정문수 | 고객콜센터: 1811-1478--%>
<%--			</address>--%>
<%--			</p>--%>
<%--		</div>--%>
<%--		<!-- float-->--%>
<%--		<form id="frmDb_floating">--%>
<%--			<div id="floating" >--%>
<%--				<div class="input_area">--%>
<%--					<div class="cont">--%>
<%--						<div class="area01">--%>
<%--							<div class="name">--%>
<%--								<label for="userName2"><img src="/mobile/images/db_text01.png?20191129122505" alt="성함"></label>--%>
<%--								<input type="text" name="userName" id="userName2" placeholder="예) 홍길동" />--%>
<%--							</div>--%>
<%--							<div class="age">--%>
<%--								<label for="userAge2"><img src="/mobile/images/db_text04.png" alt="상담내용"></label>--%>
<%--								<input type="text" class="numbersOnly" name="userAge" id="userAge2" placeholder="예) 56" maxlength="2" title="나이" />--%>
<%--								<span><img src="/mobile/images/db_text04_a.png" alt="세"></span>--%>
<%--							</div>--%>
<%--							<div class="sex">--%>
<%--								<label><img src="/mobile/images/db_text06.png?20191129122505" alt="성별"></label>--%>
<%--								<input type="radio" id="gender-men02" name="gender" value="남" checked="checked">--%>
<%--								<label for="gender-men02">남</label>--%>
<%--								<input type="radio" id="gender-women02" name="gender" value="여">--%>
<%--								<label for="gender-women02">여</label>--%>
<%--							</div>--%>
<%--						</div>--%>


<%--						<div class="area02">--%>
<%--							<div class="mobile">--%>
<%--								<label for="userMobile2"><img src="/mobile/images/db_text02.png?20191129122505" alt="연락처"></label>--%>
<%--								<input type="text" class="numbersOnly" name="userMobile" id="userMobile2" placeholder="예) 01012345678" maxlength="11" />--%>
<%--							</div>--%>
<%--							<div class="consult">--%>
<%--								<label for="userConsult2"><img src="/mobile/images/db_text03.png" alt="상담내용"></label>--%>
<%--								<input type="text" name="userConsult" id="userConsult2" placeholder="(선택 사항)"/>--%>
<%--							</div>--%>
<%--						</div>--%>

<%--						<div class="area03">--%>
<%--							<input type="checkbox" name="agree" id="agree02" checked="checked" /><label for="agree02"><img src="/mobile/images/db_text05.png" alt="개인정보취급동의"></label>--%>
<%--							<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>--%>
<%--						</div>--%>
<%--						<div class="area04">--%>
<%--							<input type="checkbox" name="agreeAdvts" id="agreeAdvts02" checked="checked" /><label for="agreeAdvts02"><img src="/mobile/images/db_text08.png?20200309183007" alt="광고성 정보(이메일, 전화, 문자)를 수신하는데 동의합니다"></label>--%>
<%--						</div>--%>
<%--						<div class="area05">--%>
<%--							<input type="checkbox" name="agreeThird" id="agreeThird02" checked="checked" /><label for="agreeThird02"><img src="/mobile/images/db_text09.png?20200309183007" alt="제 3자 제공 및 활용 동의합니다"></label>--%>
<%--							<a href="javascript:void(0);" data-role="open_popup" data-send="popup_agree" ><img src="/mobile/images/db_btn01.png" alt="내용보기"/></a>--%>
<%--						</div>--%>
<%--					</div>--%>

<%--					<div class="btn">--%>
<%--						<a id="" href="javascript:void(0);"><img src="/mobile/images/float_btn_down.png" alt="닫기"></a>--%>
<%--					</div>--%>

<%--				</div>--%>

<%--				<div class="inner default">--%>
<%--					<ul>--%>
<%--						<li><a href="javascript:void(0);" class="btn01"><img src="/mobile/images/float_btn01_off.png?20191129122505" alt="상담원 연결하기"></a></li>--%>
<%--						<li><a href="javascript:void(0);" class="btn02"><img src="/mobile/images/float_btn02_off.png?20191129122505" alt="가격 확인하기"></a></li>--%>
<%--					</ul>--%>
<%--				</div>--%>

<%--				<div class="inner active">--%>
<%--					<ul>--%>
<%--						<li class="active01">--%>
<%--							<a href="javascript:void(0);" class="btn01">--%>
<%--								<img class="insertDb" src="/mobile/images/float_btn01_on.png?20191129122505" alt="상담원 연결하기">--%>
<%--								<div class="sc-loaders">--%>
<%--									<div class="s-spinners">--%>
<%--										<div class="s-bounce1"></div>--%>
<%--										<div class="s-bounce2"></div>--%>
<%--										<div class="s-bounce3"></div>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--						<li class="active02">--%>
<%--							<a href="javascript:void(0);" class="btn02">--%>
<%--								<img class="insertDb" src="/mobile/images/float_btn02_on.png?20191129122505" alt="가격 확인하기">--%>
<%--								<div class="sc-loaders">--%>
<%--									<div class="s-spinners">--%>
<%--										<div class="s-bounce1"></div>--%>
<%--										<div class="s-bounce2"></div>--%>
<%--										<div class="s-bounce3"></div>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--					</ul>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<%@ include file="/WEB-INF/views/common/utmParam.jsp"%>--%>
<%--		</form>--%>
<%--		<!-- // float -->--%>
<%--	</div>--%>
<%--	<!-- // contents -->--%>
<%--</div>--%>
</body>
</html>


