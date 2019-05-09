class RenameStatusToStatuses < ActiveRecord::Migration
  def change
    rename_column :statuses, :status, :status_type
  end
end
