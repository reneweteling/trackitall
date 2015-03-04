json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :user_id, :project_id, :template_id, :invoicedate, :invoicenumber, :concerns, :tax, :total
  json.url invoice_url(invoice, format: :json)
end
