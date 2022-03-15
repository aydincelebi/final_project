class JobApplicationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string
  attribute :company_id, :integer
  attribute :interest_level, :integer
  attribute :platform, :integer
  attribute :networking, :integer
  attribute :comments, :string
  attribute :applied_on, :date
  attribute :heard_back_on, :datetime
  attribute :user_id, :integer
  attribute :job_type_id, :integer
  attribute :url, :string

  # Direct associations

  # Indirect associations

end