// Change paginate buttons to be ajax
function ajaxifyPaginate() {
    $("ul.pagination li a").each(function() {
        if ($(this).attr("href") != "#") {
            $(this).attr("data-remote","true");
        }
    });
}
$(ajaxifyPaginate);