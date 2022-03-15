class User < ApplicationRecord
  # Direct associations

  has_many   :job_applications,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end

end
