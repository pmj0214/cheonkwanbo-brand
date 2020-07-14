$(document).ready(function() {

    $('#dataTable').DataTable({
        searching: false,
        ordering: false,
        paging: false
    });

    $(".excel-btn").click(function(){
        var thisForm = this.form;
        $(thisForm).attr("action","/admin/excel");
        $(thisForm).submit();
        $(thisForm).attr("action","/admin");
    });

    $("#dateFrom").datetimepicker({
        format: 'YYYY/MM/DD'
    }).on('dp.change', function(ev){
        $("input[name=dateFrom]").val(
            ev.date.format('YYYYMMDD')
        )
    });

    $("#dateTo").datetimepicker({
        format: 'YYYY/MM/DD'
    }).on('dp.change', function(ev){
        $("input[name=dateTo]").val(
            ev.date.format('YYYYMMDD')
        )
    });

    $(".card-header").text(
        $("#dateFrom").val()
            .concat(" ~ ")
            .concat($("#dateTo").val())
    );

    $("#dateToday").click(function(){
        searchBtn(this.value);
    });

    $("#dateYesterday").click(function(){
        searchBtn(this.value);
    });

    function searchBtn(date){
        location.href = "/admin?dateFrom="
            .concat(date)
            .concat("&dateTo=")
            .concat(date);
    }

    $(".btn-logout").click(function(){
        var url = "/admin/logout";
        $.get(url, function(){
            location.href = "/admin";
        }, 'json').fail(function(data){
            console.log(data);
        });
    });

});
