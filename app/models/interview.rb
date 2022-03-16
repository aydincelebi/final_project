class Interview < ApplicationRecord
  # Direct associations

  has_many   :interview_styles,
             dependent: :destroy

  belongs_to :role,
             class_name: "JobApplication",
             foreign_key: "application_id"

  # Indirect associations

  has_many   :styles,
             through: :interview_styles,
             source: :style

  # Validations

  validates :interview_round,
            inclusion: { in: ["Application", "1st Round", "2nd Round", "3rd Round",
                              "Final Round"] }

  validates :status, presence: true

  validates :status,
            inclusion: { in: ["Pending", "Rejected", "Passed"] }

  # Scopes

  def to_s
    role.to_s
  end
end
