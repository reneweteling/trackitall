json.array!(@components) do |component|
  json.extract! component, :id, :invoice_id, :price_id, :name, :description, :amount, :custom_price, :custom_taxpercentage
  json.url component_url(component, format: :json)
end
