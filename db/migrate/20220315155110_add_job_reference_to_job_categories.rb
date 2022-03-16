class AddJobReferenceToJobCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :job_categories, :job_types, column: :job_id
    add_index :job_categories, :job_id
    change_column_null :job_categories, :job_id, false
  end
end
