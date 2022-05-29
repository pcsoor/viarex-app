class CreateBoardEdges < ActiveRecord::Migration[6.1]
  def change
    create_table :board_edges do |t|
      t.string :label

      t.timestamps
    end
  end
end
