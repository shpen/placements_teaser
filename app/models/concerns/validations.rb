module Validations
  extend ActiveSupport::Concern

  included do
    validate :reviewed_validation, on: :update

    # Helper method to ensure that we do not try to un-review an item or campaign
    def reviewed_validation
      if self.changed_attributes[:reviewed] && !self.reviewed
        errors[:reviewed] << "cannot be undone."
      end
    end
  end
end