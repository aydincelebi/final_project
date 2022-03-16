class AddJobwebsiteReferenceToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :job_applications, :application_websites, column: :platform
    add_index :job_applications, :platform
    change_column_null :job_applications, :platform, false
  end
end
