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
		expect(merchant1_items.count).to eq(2)

		expect(merchant1_items.first).to have_key(:id)
		expect(merchant1_items.first[:id]).to be_an(Integer)

		expect(merchant1_items.first).to have_key(:name)
		expect(merchant1_items.first[:name]).to be_a(String)

		expect(merchant1_items.first).to have_key(:description)
		expect(merchant1_items.first[:description]).to be_a(String)

		expect(merchant1_items.first).to have_key(:unit_price)
		expect(merchant1_items.first[:unit_price]).to be_a(Float)

		expect(merchant1_items.first[:merchant_id]).to_not eq(merchant2.id)

		merchant1.items.each do |item| 
			merchant2.items.each do |item2|
				expect(item.id).to_not eq(item2.id)
			end
		end 
	end 
end 