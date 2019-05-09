class AddDesativadoStatusobra < ActiveRecord::Migration
  def change
    add_column :statusobras, :desativado, :boolean, :default => false
  end
end
