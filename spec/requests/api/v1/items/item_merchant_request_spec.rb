require 'rails_helper' 

RSpec.describe "Gets An Items Merchant" do  
  it "sends merchant of an item" do 
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant2.id)
    
    get "/api/v1/items/#{item1.id}/merchant"
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful 

    expect(merchant.count).to eq(1)
		
   
    expect(merchant[:data][:id]).to eq(merchant1.id.to_s)
    expect(merchant[:data][:id]).to_not eq(merchant2.id)
		
    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to eq(merchant1.name)
		
    expect(merchant.count).to_not eq(0)
  end 
end 