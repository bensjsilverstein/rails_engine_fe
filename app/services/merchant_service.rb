require 'faraday'
require 'json'

class MerchantService
  class MerchantNotFoundError < StandardError; end

  def find_all_merchants
    response = conn.get("/api/v1/merchants")
    body = JSON.parse(response.body, symbolize_names: true)
  end

  def find_merchant(id)
    response = conn.get("/api/v1/merchants/#{id}")
    if response.status == 404
      raise MerchantNotFoundError.new("Merchant with ID #{id} not found")
    end
    body = JSON.parse(response.body, symbolize_names: true)
  end

  def find_all_merchant_items(id)
    response = conn.get("/api/v1/merchants/#{id}/items")
    body = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "http://localhost:3000")
  end
end
