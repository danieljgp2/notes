$(document).on('turbolinks:load', function () {
    $('#note-form').hide();
    $('#new-note').on('click', function() {
        $('.hide-note-form').addClass('d-none');
        $('.show-note-form').removeClass('d-none');
        $('#note-form').show();
    });
});
var showForm = function(id) {
    $('#note-form').hide();
    $('.hide-note-form').addClass('d-none');
    $('.show-note-form').removeClass('d-none');
    $('#note-'+id+'-form').removeClass('d-none');
    $('#note-'+id+'-information').addClass('d-none');
}