// Change paginate buttons to be ajax
function ajaxifyPaginate() {
    $("ul.pagination li a").each(function() {
        if ($(this).attr("href") != "#") {
            $(this).attr("data-remote","true");
        }
    });
}
$(ajaxifyPaginate);

// Editable adjustments
$(document).on('click', 'td.adjustments a', function() {
    $(this).siblings('form').show();
    $(this).siblings('.content').hide();
});

$(document).on('click', 'button.cancel', function() {
    $(this).parent().hide();
    $(this).parent().siblings('.content').show();
});