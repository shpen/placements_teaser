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
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
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
      params.require(:line_item).permit(:name, :campaign_id, :booked_amount, :actual_amount, :adjustments)
    end
end
