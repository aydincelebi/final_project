class InterviewStyle < ApplicationRecord
  # Direct associations

  belongs_to :style

  belongs_to :interview

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    interview.to_s
  end

end
