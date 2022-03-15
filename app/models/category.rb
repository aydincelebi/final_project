class Category < ApplicationRecord
  # Direct associations

  has_many   :job_categories,
             :dependent => :destroy

  # Indirect associations

  has_many   :job_applications,
             :through => :job_categories,
             :source => :job_application

  # Validations

  # Scopes

  def to_s
    name
  end

end
