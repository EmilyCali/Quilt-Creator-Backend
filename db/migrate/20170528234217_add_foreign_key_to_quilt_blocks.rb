class AddForeignKeyToQuiltBlocks < ActiveRecord::Migration[5.0]
  def change
    #quilt_blocks belong to users
    add_column :quilt_blocks, :user_id, :integer
  end
end
