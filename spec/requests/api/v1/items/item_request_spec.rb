require 'rails_helper' 

RSpec.describe "Gets One Item" do  
  it "sends one item" do 
    merchant = create(:merchant)
    create_list(:item, 2, merchant_id: merchant.id)
    item1 = Item.first 
    item2 = Item.last

    get "/api/v1/items/#{item1.id}"

    item = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful 

    expect(item.count).to eq(1)
    expect(item.count).to_not eq(0)

		expect(item[:data]).to have_key(:id)
    
		expect(item[:data][:attributes]).to have_key(:name)
		expect(item[:data][:attributes]).to have_key(:description)
		expect(item[:data][:attributes]).to have_key(:unit_price)
    
    expect(item[:data][:id]).to_not eq(item2.id)
		expect(item[:data][:name]).to_not eq(item2.name)
  end 
end 