class AddStyleReferenceToInterviewStyles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interview_styles, :styles
    add_index :interview_styles, :style_id
    change_column_null :interview_styles, :style_id, false
  end
end
