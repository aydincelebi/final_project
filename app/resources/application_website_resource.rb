class ApplicationWebsiteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :integer
  attribute :url, :string

  # Direct associations

  has_many   :job_applications,
             foreign_key: :platform

  # Indirect associations

end
