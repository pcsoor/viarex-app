class BoardType < ApplicationRecord
  has_many :boards, foreign_key: :board_type_id, class_name: "Board"
end
