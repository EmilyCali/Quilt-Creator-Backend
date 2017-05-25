class CreateQuilts < ActiveRecord::Migration[5.0]
  def change
    create_table :quilts do |t|
      t.integer :num_colors
      t.integer :size_block
      t.string :size_quilt
      t.string :difficulty
      t.integer :piece_size

      t.timestamps
    end
  end
end
