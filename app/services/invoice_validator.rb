class InvoiceValidator
  def self.validate(invoice_number)
    response = RestClient.post 'https://my.api.mockaroo.com/invoices.json', 
                               { invoice_id: invoice_number }.to_json, 
                               { content_type: :json, accept: :json, 'X-API-Key' => 'b490bb80' }
    JSON.parse(response.body)
  end
end
