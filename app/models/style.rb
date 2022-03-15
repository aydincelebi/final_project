class Style < ApplicationRecord
  # Direct associations

  has_many   :interview_styles,
             :dependent => :destroy

  # Indirect associations

  has_many   :interviews,
             :through => :interview_styles,
             :source => :interview

  # Validations

  # Scopes

  def to_s
    name
  end

end
