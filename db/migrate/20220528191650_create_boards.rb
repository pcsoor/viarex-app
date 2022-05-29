class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.references :board_type, foreign_key: true
      t.references :order_item, null: false, foreign_key: true
      t.references :banding_long_1, foreign_key: {to_table: 'board_edges'}
      t.references :banding_long_2, foreign_key: {to_table: 'board_edges'}
      t.references :banding_short_1, foreign_key: {to_table: 'board_edges'}
      t.references :banding_short_2, foreign_key: {to_table: 'board_edges'}
      t.boolean :vein
      t.decimal :width
      t.decimal :length

      t.timestamps
    end
  end
end
