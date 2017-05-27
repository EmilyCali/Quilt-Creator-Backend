class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.references :block, foreign_key: true
      t.references :piece, foreign_key: true
      t.integer :grid_position

      t.timestamps
    end
  end
end
