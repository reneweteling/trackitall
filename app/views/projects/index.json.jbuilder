json.array!(@projects) do |project|
  json.extract! project, :id, :company_id, :name, :descrtiption
  json.url project_url(project, format: :json)
end
