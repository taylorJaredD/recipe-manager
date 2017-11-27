class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :img_url
      t.string :description
      t.string :directions
      t.string :bake_time
      t.string :baking_method
      t.string :serving_size

      t.timestamps

      t.references :user, index: true, foreign_key: true
    end
  end
end
