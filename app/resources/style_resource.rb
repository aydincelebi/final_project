class StyleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :resume_drop, :string
  attribute :strategy, :string
  attribute :take_home, :string
  attribute :product_case, :string

  # Direct associations

  has_many :interview_styles

  # Indirect associations

  many_to_many :interviews
end
