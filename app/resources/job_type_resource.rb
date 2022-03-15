class JobTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :product, :integer
  attribute :strategy, :integer
  attribute :new_business_launch, :integer
  attribute :venture_capital, :integer

  # Direct associations

  has_many   :job_categories,
             foreign_key: :job_id

  # Indirect associations
end
