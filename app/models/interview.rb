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

  validates :resume_drop, inclusion: { in: ["0", "1"] }

  validates :status, presence: true

  validates :status,
            inclusion: { in: ["pending", "rejected", "passed"] }

  validates :strategy, inclusion: { in: ["0", "1"] }

  validates :take_home, inclusion: { in: ["0", "1"] }

  # Scopes

  def to_s
    role.to_s
  end
end
