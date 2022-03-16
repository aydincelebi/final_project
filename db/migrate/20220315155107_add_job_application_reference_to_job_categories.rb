class AddJobApplicationReferenceToJobCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :job_categories, :job_applications
    add_index :job_categories, :job_application_id
    change_column_null :job_categories, :job_application_id, false
  end
end
