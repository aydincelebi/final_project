class CreateJobCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :job_categories do |t|
      t.integer :category_id
      t.integer :job_application_id
      t.integer :job_id

      t.timestamps
    end
  end
end
