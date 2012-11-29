class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :name
      t.integer :parent1
      t.integer :parent2

      t.timestamps
    end
  end
end
