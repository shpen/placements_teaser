module LineItemsHelper
  # Helper to build header links for sorting
  #
  #   display_name: text to show
  #   sort_name: internal SQL row name
  #   active_sort: currently displayed sort
  #   active_order: currently displayed sort order
  def sortable_header(display_name, sort_name, active_sort, active_order)

    # Check if this column is actively sorted
    if active_sort == sort_name

      # Set direction of sort on-click to be opposite current sort
      active_class = "active"
      if active_order == "asc"
        glyph = "arrow-up"
        order = "desc"
      else
        glyph = "arrow-down"
        order = "asc"
      end

    # Default to descending sort on click
    else
      order = "desc"
      glyph = "sort"
    end

    # Build link
    link_to root_path(@params.merge(sort: sort_name, order: order)), remote: true do
      raw("#{display_name} <span class='glyphicon glyphicon-#{glyph} #{active_class}' aria-hidden='true'></span>")
    end
  end
end