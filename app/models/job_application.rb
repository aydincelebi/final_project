class JobApplication < ApplicationRecord
  # Direct associations

  belongs_to :job_platform,
             class_name: "ApplicationWebsite",
             foreign_key: "platform"

  belongs_to :user

  has_many   :job_categories,
             dependent: :destroy

  has_many   :interviews,
             foreign_key: "application_id",
             dependent: :destroy

  belongs_to :firm,
             class_name: "Company",
             foreign_key: "company_id"

  # Indirect associations

  has_many   :categories,
             through: :job_categories,
             source: :category

  # Validations

  validates :applied_on, presence: true

  validates :description, presence: true

  validates :interest_level, presence: true

  validates :interest_level, numericality: { equal_to: 1 }

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
