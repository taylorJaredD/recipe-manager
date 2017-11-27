class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :amount
      t.string :measurement
      t.string :ingredient_list

      t.references :recipe, foreign_key: true
    end
  end
end
