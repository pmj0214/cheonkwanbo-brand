function page11Slide(no){
    $('#page11 .slide').attr('no', no);
    $('#page11 .arrow .dot').removeClass('on');
    $('#page11 .arrow .dot[no='+no+']').addClass('on');
    $('#page11 .slide-in').css('left', -$('#page11 .slide').width()*no+'px');
}
$(function(){
    $('#page5 .slide').swipe({
		swipe:function(event, direction) {
            if(direction == 'left') $('#page5 .ar').click();
			if(direction == 'right') $('#page5 .al').click();
		}
	});
    $('#page5 .al, #page5 .ar').click(function(){
        var dir = 1;
        if($(this).hasClass('al')) dir = -1;
        var no = parseInt($('#page5 .slide').attr('no'));
        no += dir;
        if(no >=0 && no < $('#page5 .slide .item').length){
            $('#page5 .slide').attr('no', no);
            $('#page5 .slide-in').css('left', -$('#page5 .slide').width()*no+'px');
        } 
    });
    $('#page11 .slide').swipe({
		swipe:function(event, direction) {
            if(direction == 'left') $('#page11 .ar').click();
			if(direction == 'right') $('#page11 .al').click();
		}
	});
    $('#page11 .al, #page11 .ar').click(function(){
        var dir = 1;
        if($(this).hasClass('al')) dir = -1;
        var no = parseInt($('#page11 .slide').attr('no'));
        no += dir;
        if(no >=0 && no < $('#page11 .slide .item').length) page11Slide(no);
    });
    $('#page11 .dot[no]').click(function(){
        page11Slide($(this).attr('no'));
    });
    $('#pagedb .radio[name]').click(function(){
        $('#pagedb .radio[name="'+$(this).attr('name')+'"]').removeClass('on');
        $('#pagedb input[name="'+$(this).attr('name')+'"]').val($(this).attr('value'));
        $(this).addClass('on');
    });
    $('.show-agree').click(function(e){
        $('body').addClass('show-overlay');
        e.preventDefault();
	});
	$('.overlay .close').click(function(){
		$('body').removeClass('show-overlay');
	});
    $('.popup .close').click(function(){
        $('.popup').hide();
    });
    $('.popup2 .btn-close').click(function(){
        $('.popup2').hide();
    });
    $('.popup2 .btn-close-today').click(function(){
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + 1 );
        document.cookie = "todayCookie=done; path=/; expires=" + todayDate.toGMTString() + ";"
        $('.popup2').hide();
    });
    if($('.popup2').length > 0){
        var cookiedata = document.cookie;
        if ( cookiedata.indexOf("todayCookie=done") < 0 ) $('.popup2').show();
        else $('.popup2').hide();
    }
});