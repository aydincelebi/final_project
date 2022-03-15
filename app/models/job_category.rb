class JobCategory < ApplicationRecord
  # Direct associations

  belongs_to :category

  belongs_to :job_application

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end
end
