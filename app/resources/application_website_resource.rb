class ApplicationWebsiteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :integer
  attribute :url, :string

  # Direct associations

  # Indirect associations

end
