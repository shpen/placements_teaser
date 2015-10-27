json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :name, :campaign_id, :booked_amount, :actual_amount, :adjustments
  json.url line_item_url(line_item, format: :json)
end
