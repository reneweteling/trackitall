json.array!(@hours) do |hour|
  json.extract! hour, :id, :user_id, :project_id, :hourtype_id, :start_time, :end_time, :descrtiption
  json.url hour_url(hour, format: :json)
end
