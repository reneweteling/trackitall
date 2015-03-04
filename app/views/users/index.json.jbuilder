json.array!(@users) do |user|
  json.extract! user, :id, :address_id, :invoice_address_id, :company_id, :name, :firstname, :lastname, :email
  json.url user_url(user, format: :json)
end
