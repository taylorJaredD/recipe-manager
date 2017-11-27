class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :amount
      t.string :measurement
      t.string :item

      t.references :recipe, index: true, foreign_key: true
    end
  end
end
