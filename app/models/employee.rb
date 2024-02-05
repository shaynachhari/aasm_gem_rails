class Employee < ApplicationRecord
  include AASM

  aasm column: 'holiday_approval_state', whiny_transitions: false do
    state :pending, initial: true
    state :approved
    state :cancelled

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :cancel do
      transitions from: [:pending, :approved], to: :cancelled
    end
  end
end