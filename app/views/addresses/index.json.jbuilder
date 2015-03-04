json.array!(@addresses) do |address|
  json.extract! address, :id, :name, :address1, :address2, :address3, :country_id, :state_province_region, :city_town, :zip_postal
  json.url address_url(address, format: :json)
end
