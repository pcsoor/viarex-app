class OrderItem < ApplicationRecord
  has_one :board, foreign_key: :order_item_id, class_name: "Board", dependent: :delete
  belongs_to :assigned_order, foreign_key: :order_id, class_name: "Order"

  accepts_nested_attributes_for :board
end
