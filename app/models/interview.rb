class Interview < ApplicationRecord
  # Direct associations

  belongs_to :role,
             :class_name => "JobApplication",
             :foreign_key => "application_id"

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
