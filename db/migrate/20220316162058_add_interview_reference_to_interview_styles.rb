class AddInterviewReferenceToInterviewStyles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interview_styles, :interviews
    add_index :interview_styles, :interview_id
    change_column_null :interview_styles, :interview_id, false
  end
end
