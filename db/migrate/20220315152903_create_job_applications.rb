class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.string :name
      t.text :description
      t.integer :company_id
      t.integer :interest_level
      t.integer :platform
      t.integer :networking
      t.text :comments
      t.date :applied_on
      t.datetime :heard_back_on
      t.integer :user_id
      t.integer :job_type_id
      t.string :url

      t.timestamps
    end
  end
end
