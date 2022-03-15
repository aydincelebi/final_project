json.extract! application_website, :id, :name, :url, :created_at, :updated_at
json.url application_website_url(application_website, format: :json)
