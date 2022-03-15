class CreateJobTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :job_types do |t|
      t.integer :product
      t.integer :strategy
      t.integer :new_business_launch
      t.integer :venture_capital

      t.timestamps
    end
  end
end
