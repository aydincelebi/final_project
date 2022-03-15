class Style < ApplicationRecord
  # Direct associations

  has_many   :interview_styles,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
