class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.integer :application_id
      t.string :interview_round
      t.integer :take_home
      t.string :status

      t.timestamps
    end
  end
end
