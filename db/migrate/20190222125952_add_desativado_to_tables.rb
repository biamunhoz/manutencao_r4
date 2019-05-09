class AddDesativadoToTables < ActiveRecord::Migration
  def change
    add_column :categories, :desativado, :boolean, :default => false
    add_column :departments, :desativado, :boolean, :default => false
    add_column :buildings, :desativado, :boolean, :default => false
  end
end
