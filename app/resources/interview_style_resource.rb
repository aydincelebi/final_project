class InterviewStyleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :interview_id, :integer
  attribute :style_id, :integer

  # Direct associations

  # Indirect associations

end