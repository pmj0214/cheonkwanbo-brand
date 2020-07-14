$(document).ready(function() {

    $('#dataTable').DataTable({
        searching: false,
        ordering: false,
        paging: false
    });

    $('#centerNm').on('change', function() {
        $("input[name=centerNm]").val(this.value)
    });

    $("#codeMonth").datetimepicker({
        format: 'YYYY-MM'
    }).on('dp.change', function(ev){
        $("input[name=codeMonth]").val(
            ev.date.format('YYYY-MM')
        )
    });

    $(".excel-btn").click(function(){
        var thisForm = this.form;
        $(thisForm).attr("action","/admin/excel");
        $(thisForm).submit();
        $(thisForm).attr("action","/admin");
    });

    $(".btn-logout").click(function(){
        var url = "/admin/logout";
        $.get(url, function(){
            location.href = "/admin";
        }, 'json').fail(function(data){
            console.log(data);
        });
    });

});
