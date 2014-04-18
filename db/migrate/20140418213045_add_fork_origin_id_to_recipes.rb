class AddForkOriginIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :fork_origin_id, :integer
  end
end
