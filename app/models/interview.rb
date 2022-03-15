class Interview < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :interview_round, :inclusion => { :in => [ "Application", "1st Round", "2nd Round", "3rd Round", "Final Round" ]  }

  validates :status, :presence => true

  validates :status, :inclusion => { :in => [ "pending", "rejected", "passed" ]  }

  validates :take_home, :inclusion => { :in => [ "0", "1" ]  }

  # Scopes

  def to_s
    role.to_s
  end

end
