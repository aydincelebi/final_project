class AddCategoryReferenceToJobCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :job_categories, :categories
    add_index :job_categories, :category_id
    change_column_null :job_categories, :category_id, false
  end
end
