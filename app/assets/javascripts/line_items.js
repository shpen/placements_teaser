// Change paginate buttons to be ajax
function ajaxifyPaginate() {
    $("ul.pagination li a").each(function() {
        if ($(this).attr("href") != "#") {
            $(this).attr("data-remote","true");
        }
    });
}
$(ajaxifyPaginate);

// Edit row
$(document).on('click', 'button.edit', function() {
    var id = $(this).closest('tr').data('id');
    $('tr.edit-row[data-id="' + id + '"]').show();
    $(this).hide();
});

$(document).on('click', 'button.done', function() {
    var tr = $(this).closest('tr');
    tr.hide();
    $('tr.data-row[data-id="' + tr.data('id') + '"] button.edit').show();
});

// Show loading spinner while waiting for ajax response
$(document).on('click', 'form button:not(.cancel), th a, ul.pagination li a', function() {
    $("#ajax_loader").show();
});