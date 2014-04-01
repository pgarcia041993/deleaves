$(document).ready(function () {
    $('input').change(function () {
        if ($(this).attr('type') === 'text') {
            var url = "/realtime/" + $('#online-application-id').attr('data-online-application-id');
            $.post( url, { field_name: $(this).attr('name'), value: $(this).val() } );
        }
    })
})