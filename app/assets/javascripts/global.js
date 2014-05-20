$(document).ready(function (e) {
    $.datepicker.setDefaults({dateFormat: 'dd/mm/yy'});
    $('div#page-1').show();
    $('li#step-1 a').addClass('highlighted');
    $('div#page-2').hide();
    $('div#page-3').hide();
//    $('#page-title').text("Personal Particulars");
    $('.pagination').hide();
    $('#page-title').append($('.pagination'));
    $('#termination-date-form').hide();
    $('#end-date-label').hide();
    $('#highest-degree-obtained').hide();

    //BEGIN PATRICKS SCRIPT ******************************************************************************************************************
    window.onload = compute();

    $('.grade').focusout(function () {

        var add_grade = 0;
        var get_count = $('#count').val();
        if ($('.grade').val() > 0 || $('.grade').val() <= 5.0 || $('.grade').val().match(/^[0-9]+$/)) {
            for (var i = 1; i <= get_count; i++) {
                var grade = $('.grade-new' + i).val() === '' ? $('.grade-orig' + i).val() : $('.grade-new' + i).val();
                if (grade === '' || grade === 'Pass' || grade === 'Fail') {
                    add_grade  += 0;
                } else {
                    var get_subject_unit = $('#subject' + i).val();
                    var subject_unit_equivalent = 0;
                    if (get_subject_unit === 'LOB') {
                        subject_unit_equivalent = 1.5;
                    } else if (get_subject_unit === 'OM') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit == 'MC') {
                        subject_unit_equivalent = 1.5;
                    } else if (get_subject_unit === 'FM1') {
                        subject_unit_equivalent = 1;
                    } else if (get_subject_unit === 'QA') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'ECON') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'MCP') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'MM') {
                        subject_unit_equivalent = 2.5;
                    } else if (get_subject_unit === 'MPO') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'BIZNET') {
                        subject_unit_equivalent = 1;
                    } else if (get_subject_unit === 'MOL') {
                        subject_unit_equivalent = 1;
                    }
                    add_grade  += parseFloat(grade) * subject_unit_equivalent;
                }
                parseFloat($('.grade-new' + i).val(grade));
            }
            var final_grade = add_grade / $('#divide').val();
            parseFloat($('#final-new').val(parseFloat(final_grade).toFixed(2)));
        }
        else {
            alert('invalid input');
        }
    });

    $('.grade').change(function () {

        var add_grade = 0;
        var get_count = $('#count').val();
        if ($('.grade').val() > 0 || $('.grade').val() <= 5.0 || $('.grade').val().match(/^[0-9]+$/)) {
            for (var i = 1; i <= get_count; i++) {
                var grade = $('.grade-new' + i).val() === '' ? $('.grade-orig' + i).val() : $('.grade-new' + i).val();
                if (grade === '' || grade === 'Pass' || grade === 'Fail') {
                    add_grade  += 0;
                } else {
                    var get_subject_unit = $('#subject' + i).val();
                    var subject_unit_equivalent = 0;
                    if (get_subject_unit === 'LOB') {
                        subject_unit_equivalent = 1.5;
                    } else if (get_subject_unit === 'OM') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit == 'MC') {
                        subject_unit_equivalent = 1.5;
                    } else if (get_subject_unit === 'FM1') {
                        subject_unit_equivalent = 1;
                    } else if (get_subject_unit === 'QA') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'ECON') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'MCP') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'MM') {
                        subject_unit_equivalent = 2.5;
                    } else if (get_subject_unit === 'MPO') {
                        subject_unit_equivalent = 2;
                    } else if (get_subject_unit === 'BIZNET') {
                        subject_unit_equivalent = 1;
                    } else if (get_subject_unit === 'MOL') {
                        subject_unit_equivalent = 1;
                    }
                    add_grade  += parseFloat(grade) * subject_unit_equivalent;
                }
                parseFloat($('.grade-new' + i).val(grade));
            }
            var final_grade = add_grade / $('#divide').val();
            parseFloat($('#final-new').val(parseFloat(final_grade).toFixed(2)));
        }
        else {
            alert('invalid input');
        }
    });

    function compute() {
        var count = $('#count').val();
        var compute_grade = $('#computegrade').val();
        var orig_grade = 0;
        for (var i = 1; i <= count; i++) {
            var grade = $('.grade-orig' + i).val();
            if (grade === '' || grade === 'Pass' || grade === 'Fail') {
                orig_grade += 0;
            }
            else {
                var get_subject_unit = $('#subject' + i).val();
                var subject_unit_equivalent = 0;
                if (get_subject_unit === 'LOB') {
                    subject_unit_equivalent = 1.5;
                } else if (get_subject_unit === 'OM') {
                    subject_unit_equivalent = 2;
                } else if (get_subject_unit == 'MC') {
                    subject_unit_equivalent = 1.5;
                } else if (get_subject_unit === 'FM1') {
                    subject_unit_equivalent = 1;
                } else if (get_subject_unit === 'QA') {
                    subject_unit_equivalent = 2;
                } else if (get_subject_unit === 'ECON') {
                    subject_unit_equivalent = 2;
                } else if (get_subject_unit === 'MCP') {
                    subject_unit_equivalent = 2;
                } else if (get_subject_unit === 'MM') {
                    subject_unit_equivalent = 2.5;
                } else if (get_subject_unit === 'MPO') {
                    subject_unit_equivalent = 2;
                } else if (get_subject_unit === 'BIZNET') {
                    subject_unit_equivalent = 1;
                } else if (get_subject_unit === 'MOL') {
                    subject_unit_equivalent = 1;
                }
                orig_grade += parseFloat(grade) * parseFloat(subject_unit_equivalent);
            }
        }
        var total = orig_grade / $('#divide').val();

        $('#final-orig').val(parseFloat(total).toFixed(2));
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