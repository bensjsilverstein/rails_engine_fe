require 'rails_helper'

RSpec.describe MerchantService do
      it 'returns merchant data' do
        VCR.use_cassette('returns_all_merchants') do
          merchant_array = MerchantService.new
          merchants = merchant_array.find_all_merchants

          expect(merchants).to be_a(Hash)
          merchant_data = merchants[:data]

          merchant_data.each do |data|
            expect(data).to have_key(:id)
            expect(data[:id]).to be_a(String)

            expect(data).to have_key(:type)
            expect(data[:type]).to eq('merchant')

            expect(data).to have_key(:attributes)
            expect(data[:attributes]).to be_a(Hash)

            merchant_attributes = data[:attributes]

            expect(merchant_attributes).to have_key(:name)
            expect(merchant_attributes[:name]).to be_a(String)
          end
        end
      end
      it 'can find a specific merchant' do
        VCR.use_cassette('returns_a_merchant') do
          merchant_array = MerchantService.new
          merchant = merchant_array.find_merchant(1)

          expect(merchant).to be_a(Hash)
          merchant_data = merchant[:data]

          merchant_data = merchant[:data]
            expect(merchant_data).to have_key(:id)
            expect(merchant_data[:id]).to be_a(String)

            expect(merchant_data).to have_key(:type)
            expect(merchant_data[:type]).to eq('merchant')

            expect(merchant_data).to have_key(:attributes)
            expect(merchant_data[:attributes]).to be_a(Hash)

            merchant_attributes = merchant_data[:attributes]

            expect(merchant_attributes).to have_key(:name)
            expect(merchant_attributes[:name]).to be_a(String)
        end
      end
      it 'can find a specific merchant' do
        VCR.use_cassette('returns_merchant_items') do
          merchant_array = MerchantService.new
          items = merchant_array.find_all_merchant_items(1)

          expect(items).to be_a(Hash)
          item_data = items[:data]

          item_data.each do |data|
            expect(data).to have_key(:id)
            expect(data[:id]).to be_a(String)

            expect(data).to have_key(:type)
            expect(data[:type]).to eq('item')

            expect(data).to have_key(:attributes)
            expect(data[:attributes]).to be_a(Hash)

            item_attributes = data[:attributes]

            expect(item_attributes).to have_key(:name)
            expect(item_attributes[:name]).to be_a(String)
            expect(item_attributes).to have_key(:description)
            expect(item_attributes[:description]).to be_a(String)
            expect(item_attributes).to have_key(:unit_price)
            expect(item_attributes[:unit_price]).to be_a(Float)
            expect(item_attributes).to have_key(:merchant_id)
            expect(item_attributes[:merchant_id]).to be_a(Integer)
          end
        end
      end


    #error functionality testing for fun (incomplete)
    xit "will ping an error if the merchant id doesn't exist" do
        merchant = MerchantService.new
        merchant_1 = merchant.find_merchant("x")
    end

  end
