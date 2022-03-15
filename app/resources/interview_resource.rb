class InterviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :application_id, :integer
  attribute :interview_round, :string
  attribute :resume_drop, :integer
  attribute :strategy, :string
  attribute :take_home, :integer
  attribute :status, :string

  # Direct associations

  has_many   :interview_styles

  belongs_to :role,
             resource: JobApplicationResource,
             foreign_key: :application_id

  # Indirect associations

  many_to_many :styles
end
