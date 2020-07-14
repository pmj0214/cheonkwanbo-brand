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