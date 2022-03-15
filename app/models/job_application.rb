class JobApplication < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :description, :presence => true

  validates :interest_level, :presence => true

  validates :interest_level, :numericality => { :equal_to => 1 }

  validates :name, :presence => true

  validates :platform, :presence => true

  validates :platform, :inclusion => { :in => [ "Kellogg Job Board", "Company Website" ]  }

  # Scopes

  def to_s
    name
  end

end
