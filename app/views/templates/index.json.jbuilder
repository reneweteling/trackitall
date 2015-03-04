json.array!(@templates) do |template|
  json.extract! template, :id, :name, :descrtiption, :user_id, :template
  json.url template_url(template, format: :json)
end
