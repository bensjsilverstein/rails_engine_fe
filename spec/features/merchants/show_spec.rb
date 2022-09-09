require 'rails_helper'

RSpec.describe 'merchant show page' do

  it "shows the merchant's items" do
    VCR.use_cassette('merchant_items') do

      merchant = MerchantFacade.all_merchants.first

      visit merchant_path(merchant.id)

      #merchant's name on show page
      expect(page).to have_content("Schroeder-Jerde")

      #item names
      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Item Expedita Aliquam")

      #different merchant
      expect(page).to_not have_content("Klein, Rempel and Jones")


      #items from a different merchant
      expect(page).to_not have_content("Item Adipisci Sint")
      expect(page).to_not have_content("Item Laudantium Ex")
    end
  end
end
