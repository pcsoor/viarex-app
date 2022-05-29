class Board < ApplicationRecord
  belongs_to :order_item, foreign_key: :order_item_id, class_name: "OrderItem"
  belongs_to :banding_long_1, foreign_key: :banding_long_1_id, class_name: "BoardEdge"
  belongs_to :banding_long_2, foreign_key: :banding_long_2_id, class_name: "BoardEdge"
  belongs_to :banding_short_1, foreign_key: :banding_short_1_id, class_name: "BoardEdge"
  belongs_to :banding_short_2, foreign_key: :banding_short_2_id, class_name: "BoardEdge"
  belongs_to :board_type, foreign_key: :board_type_id, class_name: "BoardType"


end
