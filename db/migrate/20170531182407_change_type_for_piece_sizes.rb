class ChangeTypeForPieceSizes < ActiveRecord::Migration[5.0]
  def change
    change_column :quilt_blocks, :piece_size, :integer
  end
end
