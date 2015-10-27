class AddReviewedToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :reviewed, :boolean
  end
end
