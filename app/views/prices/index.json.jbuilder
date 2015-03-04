json.array!(@prices) do |price|
  json.extract! price, :id, :user_id, :name, :price, :taxpercentage
  json.url price_url(price, format: :json)
end
