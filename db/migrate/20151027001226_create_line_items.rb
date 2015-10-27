class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.references :campaign, index: true
      t.decimal :booked_amount
      t.decimal :actual_amount
      t.decimal :adjustments

      t.timestamps null: false
    end
    add_foreign_key :line_items, :campaigns
  end
end
