json.extract! job_category, :id, :category_id, :job_application_id, :job_id, :created_at, :updated_at
json.url job_category_url(job_category, format: :json)
