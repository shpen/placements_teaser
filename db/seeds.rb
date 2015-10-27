# Campaign and LineItem ids are forced to values found in JSON data to keep consistency
# and avoid a potential relation error if seed data is not sorted properly

# Open file
json = JSON.parse(File.read("db/seeds/placements_teaser_data.json"))

# Run as one transaction to increase disk speed
ActiveRecord::Base.transaction do

  # Process entries
  json.each do |line_item|

    # Pull out data
    id = line_item["id"]
    campaign_id = line_item["campaign_id"]
    campaign_name = line_item["campaign_name"]
    line_item_name = line_item["line_item_name"]
    booked_amount = line_item["booked_amount"]
    actual_amount = line_item["actual_amount"]
    adjustments = line_item["adjustments"]

    # Create campaign if needed
    campaign = Campaign.find_by(id: campaign_id)
    if campaign.nil?
      campaign = Campaign.create(name: campaign_name)

      # Force id
      campaign.update_column(:id, campaign_id)
    end

    # Create line_item and force id
    LineItem.create(campaign: campaign, name: line_item_name, booked_amount: booked_amount,
      actual_amount: actual_amount, adjustments: adjustments, billable_amount: actual_amount + adjustments).update_column(:id, id)
  end
end