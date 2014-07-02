//$(document).ready(function () {
//    var term = $('#flag-term').text();
//    alert(term);
//    $('.student-row').each(function() {
//        var student_number = $(this).children('td:first').text();
//        var jsonData = $.ajax({
//            url: '/api/gpa/' + student_number,
//            async: false
//        }).responseText;
//        var gpa = JSON.parse(jsonData)['gpa'];
//        $(this).find(':nth-child(3)').text(gpa);
//    });
//    alert('Done');
//})

$(document).ready(function (e) {
    $.datepicker.setDefaults({dateFormat: 'dd/mm/yy'});
    $('div#page-1').show();
    $('li#step-1 a').addClass('highlighted');
    $('div#page-2').hide();
    $('div#page-3').hide();
    $('#page-title').text("Class Card");
    $('.pagination').hide();
    $('#page-title').append($('.pagination'));
    $('#termination-date-form').hide();
    $('#end-date-label').hide();
    $('#highest-degree-obtained').hide();
    $('#spinner-rank').hide();

    $('input.grade').change(function (e) {
        var selector_name = this.id;
        var new_grade = $('#' + selector_name).val();
        $.ajax({
            url: '/updates/grade/' + selector_name + "?grade=" + new_grade
        }).responseText;
    })

    //BEGIN PATRICKS SCRIPT ******************************************************************************************************************
    window.onload = compute();
    window.onload = compute2();

    $('.grade').change(function () {
        $('#spinner-rank').show();
        $('#new-rank-place').hide();

        var count_fail = 0
        var add_grade = 0;
        var get_count = $('#count').val();
        if ($('.grade').val() > 0 || $('.grade').val() <= 5.0 || $('.grade').val().match(/^[0-9]+$/)) {
            for (var i = 1; i <= get_count; i++) {
                var grade = $('.grade-new' + i).val() === '' ? $('.grade-orig' + i).val() : $('.grade-new' + i).val();
                if (grade === '' || grade === 'Pass' || grade === 'Fail') {
                    add_grade += 0;
                } else {
                    var get_subject_unit = $('#units' + i).val();
                    if ($('.grade-new' + i).val() < 3.0) {
                        count_fail = parseFloat(count_fail) + parseFloat(get_subject_unit);
                    }
                    add_grade += parseFloat(grade) * get_subject_unit;
                }
                parseFloat($('.grade-new' + i).val(grade));
            }
            var final_grade = add_grade / $('#divide').val();
//            parseFloat($('#final-new').val(parseFloat(final_grade).toFixed(2)));
            document.getElementById('final-new').innerHTML = final_grade.toFixed(2);
            $('.gpa_new').text(final_grade.toFixed(2));
            var selector_name = $('#student-id').val();

            var jsonData = $.ajax({
                url: '/updates/gpa/' + selector_name + "?gpa=" + final_grade.toFixed(2),
                async: false
            }).responseText;

            var jsonResponse = JSON.parse(jsonData);
            $('#new-rank-place').text(jsonResponse['new_rank']);
            $('#new-rank-place').show();
            $('#spinner-rank').hide();

            $.ajax({
                url: '/updates/fail/' + selector_name + "?fail=" + count_fail,
                async: false
            }).responseText;

            $('#count_fail').val(count_fail);
            document.getElementById('count_fail').innerHTML = count_fail;
        }
        else {
            alert('invalid input');
        }
    });

    $('.grade').change(function () {
        var count_fail = 0
        var add_grade = 0;
        var get_count = $('#count').val();
        if ($('.grade').val() > 0 || $('.grade').val() <= 5.0 || $('.grade').val().match(/^[0-9]+$/)) {
            for (var i = 1; i <= get_count; i++) {
                var grade = $('.grade-new' + i).val() === '' ? $('.grade-orig' + i).val() : $('.grade-new' + i).val();
                if (grade === '' || grade === 'Pass' || grade === 'Fail') {
                    add_grade += 0;
                } else {
                    var get_subject_unit = $('#units' + i).val();
                    if ($('.grade-new' + i).val() < 3.0) {
                        count_fail = parseFloat(count_fail) + parseFloat(get_subject_unit);
                    }
                    add_grade += parseFloat(grade) * get_subject_unit;

                }
                parseFloat($('.grade-new' + i).val(grade));
            }
            var final_grade = add_grade / $('#divide').val();
//            parseFloat($('#final-new').val(parseFloat(final_grade).toFixed(2)));
            document.getElementById('final-new').innerHTML = final_grade.toFixed(2);

            $('#count_fail').val(count_fail);
            document.getElementById('count_fail').innerHTML = count_fail;
        }
        else {
            alert('invalid input');
        }
    });

    function compute() {
        var count = $('#count').val();
        var orig_grade = 0;
        for (var i = 1; i <= count; i++) {

            var grade = $('.grade-orig' + i).val();
           if (grade === '' || grade === 'Pass' || grade === 'Fail' ) {
                orig_grade += 0;
            }
            else {
                var get_subject_unit = $('#units' + i).val();
                orig_grade += parseFloat(grade) * parseFloat(get_subject_unit);
                alert(orig_grade + ' ' + grade);
            }
        }

        var total = orig_grade / $('#divide').val();
//        $('#final-orig').val(parseFloat(total).toFixed(2));
        document.getElementById('final-orig').innerHTML = total.toFixed(2);

    }

    function compute2() {
        var count_fail = 0
        var add_grade = 0;
        var get_count = $('#count').val();
        if ($('.grade').val() > 0 || $('.grade').val() <= 5.0 || $('.grade').val().match(/^[0-9]+$/)) {
            for (var i = 1; i <= get_count; i++) {
                var grade = $('.grade-new' + i).val() === '' ? $('.grade-orig' + i).val() : $('.grade-new' + i).val();
                if (grade === '' || grade === 'Pass' || grade === 'Fail') {
                    add_grade += 0;
                } else {
                    var get_subject_unit = $('#units' + i).val();
                    add_grade += parseFloat(grade) * get_subject_unit;
                }
                parseFloat($('.grade-new' + i).val(grade));
            }
            var final_grade = add_grade / $('#divide').val();
//            parseFloat($('#final-new').val(parseFloat(final_grade).toFixed(2)));
            document.getElementById('final-new').innerHTML = final_grade.toFixed(2);
            for (var i = 1; i <= get_count; i++) {
                if ($('.grade-new' + i).val() < 3.0) {
                    count_fail = parseFloat(count_fail) + parseFloat($('#units' + i).val());
                }
                document.getElementById('count_fail').innerHTML = count_fail;
                $('.gpa_new').text(final_grade.toFixed(2));
//            document.getElementsByClassName('gpa_new').innerHTML = final_grade.toFixed(2);
            }
        }

        else {
            alert('invalid input');
        }
    }

//END PATRICKS SCRIPT ****************************************************************************************************

    $('#begin-app-submit').click(function (e) {
        if ($('#email').val().search('test') != -1) {
            e.preventDefault();
            alert('Kindly contact ICT\'s Quality Assurance department to request for assistance during testing');
        }
    })

    $('.date-pick').datepicker();

    if ($('.dob').attr('value') === undefined) {
        $('.dob').datepicker("setDate", "01/01/1980");
    }

    $('button#submit').click(function (e) {
        if ($('.dob').val() == "") {
            e.preventDefault();
        }
    })


    $.each($('.date-pick.non-dob'), function (e) {
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

$(document).ready(function () {
    var term = $('#flag-term').text();
    //alert(term);
})