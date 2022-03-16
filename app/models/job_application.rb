class JobApplication < ApplicationRecord
  # Direct associations

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

  validates :interest_level,
            numericality: { less_than_or_equal_to: 5,
                            greater_than_or_equal_to: 1 }

  validates :name, presence: true

  validates :networking, presence: true

  validates :networking,
            numericality: { less_than_or_equal_to: 1,
                            greater_than_or_equal_to: 0 }

  # Scopes

  def to_s
    name
  end
end
