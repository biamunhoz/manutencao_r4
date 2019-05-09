class RenameCategoryToCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :category, :category_type
  end
end
