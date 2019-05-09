class AddDesativadoToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :desativado, :boolean, :default => false
  end
end
