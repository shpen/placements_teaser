class LineItem < ActiveRecord::Base
  belongs_to :campaign

  include Validations
  validates :adjustments, numericality: true

  before_save do
    self.billable_amount = self.adjustments + self.actual_amount
  end
end
