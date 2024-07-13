class Order < ApplicationRecord
  enum status: { pending: 0, placed: 1, shipped: 2, completed: 3, cancelled: 4 }
end
