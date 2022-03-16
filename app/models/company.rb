class Company < ApplicationRecord
  # Direct associations

  has_many   :roles,
             class_name: "JobApplication",
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
