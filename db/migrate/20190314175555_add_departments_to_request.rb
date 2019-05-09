class AddDepartmentsToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :department_id, :integer, index: true, foreign_key: true
  end
end
