class AddTriangleCountToQuiltBlocks < ActiveRecord::Migration[5.0]
  def change
    #new column to count triangles
    add_column :quilt_blocks, :triangles, :integer
  end
end
