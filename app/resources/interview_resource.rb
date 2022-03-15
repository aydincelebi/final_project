class InterviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :application_id, :integer
  attribute :interview_round, :string
  attribute :take_home, :integer
  attribute :status, :string

  # Direct associations

  # Indirect associations

end
