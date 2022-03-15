class JobCategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_id, :integer
  attribute :job_application_id, :integer
  attribute :job_id, :integer

  # Direct associations

  # Indirect associations

end