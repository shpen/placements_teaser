class CampaignsController < ApplicationController

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update(campaign_params)
        format.js
      else
        format.js { render "shared/error.js", locals: { message: @campaign.errors.full_messages.join("\n") } }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:reviewed)
    end
end
