require 'rails_helper' 

RSpec.describe "Gets All Items For A Given Merchant ID" do 
	it "send all items for a given merchant id" do 
		merchant1 = create(:merchant)
		merchant2 = create(:merchant)
	
		create_list(:item, 2, merchant_id: merchant1.id)
		create_list(:item, 2, merchant_id: merchant2.id)

		get "/api/v1/merchants/#{merchant1.id}/items"

		merchant1_items = JSON.parse(response.body, symbolize_names: true)
		expect(response).to be_successful 
		expect(merchant1_items.count).to eq(1)

		expect(merchant1_items[:data].first).to have_key(:id)

		expect(merchant1_items[:data].first[:attributes]).to have_key(:name)

		expect(merchant1_items[:data].first[:attributes]).to have_key(:description)

		expect(merchant1_items[:data].first[:attributes]).to have_key(:unit_price)

		expect(merchant1_items[:data].first[:merchant_id]).to_not eq(merchant2.id)

	end 
end 