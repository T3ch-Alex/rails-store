class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :nome
      t.integer :quantidade
      t.decimal :valor

      t.timestamps
    end
  end
end
