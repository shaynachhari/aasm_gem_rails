class Order < ApplicationRecord
  include AASM

  validates :name,:state, presence: true 

  aasm column: 'state' do
    state :pending, initial: true
    state :processing
    state :shipped
    state :delivered

    event :process do
      transitions from: :pending, to: :processing
    end

    event :ship do
      transitions from: :processing, to: :shipped
    end

    event :deliver do
      transitions from: :shipped, to: :delivered
    end
  end
end
