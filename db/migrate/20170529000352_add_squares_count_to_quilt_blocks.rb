class AddSquaresCountToQuiltBlocks < ActiveRecord::Migration[5.0]
  def change
    #new column to count squares
    add_column :quilt_blocks, :squares, :integer
  end
end
