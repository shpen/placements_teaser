module Validations
  extend ActiveSupport::Concern

  included do
    validate :reviewed_validation, on: :update

    def reviewed_validation
      if self.changed_attributes[:reviewed] && !self.reviewed
        errors[:reviewed] << "cannot be undone."
      end
    end
  end
end