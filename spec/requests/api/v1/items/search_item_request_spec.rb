require 'rails_helper' 

RSpec.describe "Gets Item Based on Search" do  
  it "sends an item from a search" do 
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)
    item = create(:item, name: "Pancakes", merchant_id: merchant.id)
    search = "Pancake"

    get "/api/v1/items/find?name=#{search}"
    
    search_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful 
    expect(search_result.count). to eq(1)

		expect(search_result[:data]).to have_key(:id)
    
		expect(search_result[:data][:attributes]).to have_key(:name)
		expect(search_result[:data][:attributes]).to have_key(:description)
		expect(search_result[:data][:attributes]).to have_key(:unit_price)
  end 
end 