class AddReviewedToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :reviewed, :boolean
  end
end
