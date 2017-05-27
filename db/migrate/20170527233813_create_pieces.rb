class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :color
      t.integer :size

      t.timestamps
    end
  end
end
