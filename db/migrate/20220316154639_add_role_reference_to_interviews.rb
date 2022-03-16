class AddRoleReferenceToInterviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interviews, :job_applications, column: :application_id
    add_index :interviews, :application_id
    change_column_null :interviews, :application_id, false
  end
end
