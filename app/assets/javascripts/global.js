$(document).ready(function (e) {
    $.datepicker.setDefaults({dateFormat: 'dd/mm/yy'});
    $('div#page-1').show();
    $('li#step-1 a').addClass('highlighted');
    $('div#page-2').hide();
    $('div#page-3').hide();
    $('#page-title').text("Personal Particulars");
    $('.pagination').hide();
    $('#page-title').append($('.pagination'));
    $('#termination-date-form').hide();
    $('#end-date-label').hide();
    $('#highest-degree-obtained').hide();

    $('#begin-app-submit').click(function(e){
       if ($('#email').val().search('test') != -1) {
           e.preventDefault();
           alert('Kindly contact ICT\'s Quality Assurance department to request for assistance during testing');
       }
    })


    $('.date-pick').datepicker();

    if ($('.dob').attr('value') === undefined) {
        $('.dob').datepicker("setDate", "01/01/1980");
    }

    $('button#submit').click(function(e) {
        if ($('.dob').val() == "") {
            e.preventDefault();
        }
    })


    $.each($('.date-pick.non-dob'), function(e) {
        var parsedDate = $.datepicker.parseDate('yy-mm-dd', $(this).attr('value'));
        $(this).datepicker("setDate", parsedDate);
    })

    $('#submit-personal-info').click(function (e) {
        e.preventDefault();
        $('#page-title').text("Employment Details");
        $('div#page-1').hide();
        $('div#page-2').show();
    })

    $('#submit-employment-info-back').click(function (e) {
        $('div#page-2').hide();
        $('#page-title').text("Personal Particulars");
        $('div#page-1').show();
        e.preventDefault();
    })

    $('#submit-employment-info-next').click(function (e) {
        $('div#page-2').hide();
        $('#page-title').text("Educational Background");
        $('div#page-3').show();
        e.preventDefault();
    })

    $('#education-back').click(function (e) {
        $('div#page-3').hide();
        $('#page-title').text("Employment Details");
        $('div#page-2').show();
        e.preventDefault();

    })

    $('#education-submit').click(function (e) {
        e.preventDefault();
        $('#application-form').submit();
    })

})

function showTerminationDate() {
    $('#termination-date-form').show();
    $('#termination-date').hide();
    $('#end-date-label').show();
}

function showCompletionDate() {
    $('#graduation-date-field-alternate').hide();
    $('#highest-degree-obtained').show();
}