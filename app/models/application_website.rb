class ApplicationWebsite < ApplicationRecord
  # Direct associations

  has_many   :job_applications,
             :foreign_key => "platform",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
