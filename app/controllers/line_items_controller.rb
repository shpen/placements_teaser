class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      adjustments = line_item_params[:adjustments].to_f
      if @line_item.update(adjustments: adjustments, billable_amount: adjustments + @line_item.actual_amount)
        format.js
      else
        format.js { "alert('@line_item.errors.full_message')"; }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:adjustments)
    end
end
