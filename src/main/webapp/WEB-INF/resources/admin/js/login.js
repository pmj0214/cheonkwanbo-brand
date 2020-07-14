$(document).ready(function(){
    $("#loginForm").submit(function(event){
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();

        $.post(url, formData, function(data){
            location.reload();
        }, 'json').fail(function(data){
            console.log(data);
            $(".alert-danger").text(data.responseJSON.message);
            $(".warning-alert").css("display","block");
        });
    });

    $(".form-control").keydown(function(){
        $(".warning-alert").css("display","none");
    });
});
