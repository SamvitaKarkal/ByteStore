class Order < ApplicationRecord
  has_many :order_products
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :customer_email, format: {with: VALID_EMAIL_REGEX}, allow_nil: true

  enum status: { pending: 0, placed: 1, shipped: 2, completed: 3, cancelled: 4 }
end
