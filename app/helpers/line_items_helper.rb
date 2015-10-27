module LineItemsHelper
  def sortable_header(display_name, sort_name, active_sort, active_order)
    if active_sort == sort_name
      active_class = "active"
      if active_order == "asc"
        glyph = "arrow-up"
        order = "desc"
      else
        glyph = "arrow-down"
        order = "asc"
      end
    else
      order = "desc"
      glyph = "sort"
    end

    link_to root_path(@params.merge(sort: sort_name, order: order)), remote: true do
      raw("#{display_name} <span class='glyphicon glyphicon-#{glyph} #{active_class}' aria-hidden='true'></span>")
    end
  end
end