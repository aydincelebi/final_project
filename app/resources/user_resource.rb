class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many :job_applications

  # Indirect associations
end
