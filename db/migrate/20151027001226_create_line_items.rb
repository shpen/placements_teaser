class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.references :campaign, index: true
      t.decimal :booked_amount, precision: 16, scale: 10
      t.decimal :actual_amount, precision: 16, scale: 10
      t.decimal :adjustments, precision: 16, scale: 10

      t.timestamps null: false
    end
    add_foreign_key :line_items, :campaigns
  end
end
