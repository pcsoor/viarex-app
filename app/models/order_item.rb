class OrderItem < ApplicationRecord
  has_many :boards, foreign_key: :order_item_id, class_name: "Board"
  belongs_to :assigned_order, foreign_key: :order_id, class_name: "Order"

  accepts_nested_attributes_for :boards
end
