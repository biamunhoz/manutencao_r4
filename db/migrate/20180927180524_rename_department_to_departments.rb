class RenameDepartmentToDepartments < ActiveRecord::Migration
  def change
    rename_column :departments, :department_number, :department_type
  end
end
