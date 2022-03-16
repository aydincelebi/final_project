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

  belongs_to :user

  has_many   :job_categories

  has_many   :interviews,
             foreign_key: :application_id

  belongs_to :firm,
             resource: CompanyResource,
             foreign_key: :company_id

  # Indirect associations

  many_to_many :categories
end
