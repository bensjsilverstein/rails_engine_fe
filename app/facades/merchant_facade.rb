class MerchantFacade

  def self.all_merchants
    MerchantService.new.find_all_merchants[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def find_merchant(id)
    Merchant.new(MerchantService.new.find_merchant(id)[:data])
  end

  def find_all_merchant_items(id)
    MerchantService.new.find_all_merchant_items(id)[:data].map do |item_data|
      Item.new(item_data)
    end
  end

end
