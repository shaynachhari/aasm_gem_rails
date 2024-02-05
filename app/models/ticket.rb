class Ticket < ApplicationRecord
  include AASM

  aasm column: 'ticket_status', whiny_transitions: false do
    state :pending, initial: true
    state :confirmed
    state :canceled

    event :confirm do
      transitions from: [:pending], to: :confirmed
    end

    event :cancel do
      transitions from: [:pending, :confirmed], to: :canceled
    end
  end
end
