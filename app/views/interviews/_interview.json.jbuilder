json.extract! interview, :id, :application_id, :interview_round, :take_home, :status, :created_at, :updated_at
json.url interview_url(interview, format: :json)