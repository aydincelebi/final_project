class JobType < ApplicationRecord
  # Direct associations

  has_many   :job_categories,
             :foreign_key => "job_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    product
  end

end
