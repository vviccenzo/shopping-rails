class AddSetorIdToProduto < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :setor_id, :integer
  end
end
