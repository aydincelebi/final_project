class JobApplication < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :platform, :inclusion => { :in => [ "Kellogg Job Board", "Company Website" ]  }

  # Scopes

  def to_s
    name
  end

end
