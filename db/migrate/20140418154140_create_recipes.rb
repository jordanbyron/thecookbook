class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.belongs_to :user
      t.text       :name
      t.text       :source
      t.text       :directions
      t.text       :ingredients
      t.timestamps
    end
  end
end
