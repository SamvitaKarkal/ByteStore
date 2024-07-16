class Order < ApplicationRecord
  include AASM

  enum status: {
    pending: 0,
    placed: 1,
    shipped: 2,
    completed: 3,
    cancelled: 4
  }

  validates :status, inclusion: { in: statuses.keys }

  aasm column: 'status', enum: true do
    state :pending, initial: true, display: "Payment Pending"
    state :placed, display: "Order Placed"
    state :shipped, display: "Order Shipped"
    state :completed, display: "Order Completed"
    state :cancelled, display: "Order Cancelled"

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipped
    end

    event :complete do
      transitions from: :shipped, to: :completed
    end

    event :cancel do
      transitions from: [:pending, :paid], to: :cancelled
    end
  end
end
