class BoardEdge < ApplicationRecord
  has_many :boards, foreign_key: :banding_long_1_id, class_name: "Board"
  has_many :boards, foreign_key: :banding_long_2_id, class_name: "Board"
  has_many :boards, foreign_key: :banding_short_1_id, class_name: "Board"
  has_many :boards, foreign_key: :banding_short_2_id, class_name: "Board"
end
