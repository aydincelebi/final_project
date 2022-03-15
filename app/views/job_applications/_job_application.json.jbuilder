json.extract! job_application, :id, :name, :description, :company_id,
              :interest_level, :platform, :networking, :comments, :applied_on, :heard_back_on, :user_id, :job_type_id, :url, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
