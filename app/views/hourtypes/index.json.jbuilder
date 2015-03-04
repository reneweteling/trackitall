json.array!(@hourtypes) do |hourtype|
  json.extract! hourtype, :id, :name, :billable, :price_id
  json.url hourtype_url(hourtype, format: :json)
end
