$(document).ready(function () {

    window.eventTag = {
        consultDb: function(){
            // 카카오
            kakaoPixel('8585226842965426771').purchase('DB');

            // 크레센도
            csf('event','1','','');

            // google ads
            gtag('event', 'conversion', {'send_to': 'AW-796367596/gzfgCJaKtLgBEOy13vsC'});

            // facebook
            fbq('track','CompleteRegistration');

            // GA
            gtag('event', 'submit', {
                'event_category': 'consult',
                'event_label': 'complete'
            });

            //tenping script
            TenpingScript.SendConversion();
        },
        showGetDb: function(userName, mobile){
            <!-- ShowGet DBTracking Script Start -->
            var SGscriptPlugIn = new function () { StarADPayment=''; this.loadSBox = function(eSRC,fnc) { var script = document.createElement('script'); script.type = 'text/javascript'; script.charset = 'utf-8'; script.onreadystatechange= function () { if((!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete') && fnc!=undefined && fnc!='' ) { eval(fnc); }; }; script.onload = function() { if(fnc!=undefined && fnc!='') { eval(fnc); }; }; script.src= eSRC; document.getElementsByTagName('head')[0].appendChild(script); }; };
            SGscriptPlugIn.loadSBox('//showget.co.kr/js/plugShow.php?ckb1','sg_paycheck.playstart()');
            SGShowID="ckb1";
            SGOrderName=userName;
            SGTotalPrice=mobile;
            SGOrderid=SGOrderName+"|dinfo|"+SGTotalPrice;
            SGscriptPlugIn.loadSBox('//showget.co.kr/js/plugShow.php?'+SGShowID, "sg_paycheck.payment('"+SGOrderid+"','"+SGTotalPrice+"','Y')");
            eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('0(5);6 0(a){1 b=2 3();1 c=b.4()+a;7(8){b=2 3();9(b.4()>c)d}}',14,14,'sleep|var|new|Date|getTime|1000|function|while|true|if||||return'.split('|'),0,{}));
            <!-- ShowGet DBTracking Script End -->
        }
    }

});
