$(document).ready(function () {
    $('.numbersOnly').keyup(function () {
        this.value = this.value.replace(/[^0-9]/gi, '');
    });

    $('.ajaxFormSubmit').dblclick(function (e) {
        e.preventDefault();
    });

    $.validator.addMethod('phoneNumber', function (value) {
        return /^01[0-1|6-9][2-9]\d{6,7}$/.test(value);
    });

    $.validator.addMethod('onlyKorean', function (value) {
        var pattern = /([^가-힣\x20])/i;
        return !pattern.test(value);
    });
});
