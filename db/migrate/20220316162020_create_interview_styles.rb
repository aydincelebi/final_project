class CreateInterviewStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_styles do |t|
      t.integer :interview_id
      t.integer :style_id

      t.timestamps
    end
  end
end
