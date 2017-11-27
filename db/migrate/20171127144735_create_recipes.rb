class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :img_url
      
      t.references :user, foreign_key: true
    end
  end
end
