json.array!(@companies) do |company|
  json.extract! company, :id, :address_id, :name, :telephone, :website, :email, :commerceno, :taxno, :iban
  json.url company_url(company, format: :json)
end
