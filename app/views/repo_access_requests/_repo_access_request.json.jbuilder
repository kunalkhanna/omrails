json.extract! repo_access_request, :id, :user_id, :repository, :repo_group, :level, :request_action, :created_at, :updated_at
json.url repo_access_request_url(repo_access_request, format: :json)