require 'rails_helper' 

RSpec.describe "Gets All Items" do  
  it "sends a list of items" do 
    merchant = create(:merchant)
    items1 = create_list(:item, 3, merchant_id: merchant.id)
    

    get "/api/v1/items"
    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful 
    expect(items.count). to eq(1)

		expect(items[:data].first).to have_key(:id)
    
		expect(items[:data].first[:attributes]).to have_key(:name)
		expect(items[:data].first[:attributes]).to have_key(:description)
		expect(items[:data].first[:attributes]).to have_key(:unit_price)
  end 
end 