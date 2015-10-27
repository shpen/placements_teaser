class AddBillableAmountToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :billable_amount, :decimal, precision: 16, scale: 10
  end
end
