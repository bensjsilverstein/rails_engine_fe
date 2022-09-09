require 'rails_helper'

RSpec.describe 'merchant index page' do

  it 'displays all merchants by name', :vcr do

    visit merchants_path

    expect(page).to have_content("Schroeder-Jerde")
    expect(page).to have_content("Klein, Rempel and Jones")
  end

  it "links the name to the merchant's show page", :vcr do
    merchant = MerchantFacade.all_merchants.first

    visit merchants_path

    click_on "Schroeder-Jerde"

    expect(current_path).to eq merchant_path(merchant.id)
    expect(current_path).to eq "/merchants/#{merchant.id}"
  end
end
