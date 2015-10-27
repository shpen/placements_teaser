class LineItemsController < ApplicationController

  # GET /line_items
  # GET /line_items.json
  def index
    # Join with Campaigns table before applying sort if needed
    if params[:sort] == "campaigns.name"
      @line_items = LineItem.joins(:campaign)
    else
      @line_items = LineItem.all
    end

    # Apply sort if enabled
    if params[:sort]
      @line_items = @line_items.order(params[:sort] + " " + params[:order])
    end

    # Limit results
    @line_items = @line_items.paginate(page: params[:page])

    # Pass params to views so they know what to draw
    @params = params.slice(:sort, :order, :page)
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      success = @line_item.update_attributes(line_item_params)
      if success
        @reviewed = @line_item.reviewed || @line_item.campaign.reviewed?

        if line_item_params[:reviewed]
          @update_edit_row = true
        end

        format.js
      else
        format.js { render "shared/error.js", locals: { message: @line_item.errors.full_messages.join("\n") } }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:adjustments, :reviewed)
    end
end
