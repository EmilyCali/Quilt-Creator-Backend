class CreateQuiltBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :quilt_blocks do |t|
      t.string :img
      t.integer :num_pieces
      t.decimal :piece_size
      t.string :difficulty
      t.string :title
      t.string :style

      t.timestamps
    end
  end
end
