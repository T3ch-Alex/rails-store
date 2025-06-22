class AddDescricaoToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :descricao, :text
  end
end
