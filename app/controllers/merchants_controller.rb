class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.all_merchants
  end

  def show
    merchants = MerchantFacade.new
    @merchant = merchants.find_merchant(params[:id])
    @items = merchants.find_all_merchant_items(params[:id])
  end
end
