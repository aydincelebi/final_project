class Interview < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :status, :presence => true

  validates :status, :inclusion => { :in => [ "pending", "rejected", "passed" ]  }

  validates :take_home, :inclusion => { :in => [ "0", "1" ]  }

  # Scopes

  def to_s
    role.to_s
  end

end
