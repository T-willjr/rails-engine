require 'rails_helper'

RSpec.describe "Get All Merchants" do 
 it "sends a list of merchants" do 
    create_list(:merchant, 3)
    create_list(:item, 3, merchant_id: Merchant.first.id)

    get "/api/v1/merchants"

    merchants = JSON.parse(response.body, symbolize_names: true)  
    expect(response).to be_successful 

    expect(merchants.count).to eq(1)
    expect(merchants[:data].first).to have_key(:id)
 
	 expect(merchants[:data].first[:attributes]).to have_key(:name)
    expect(merchants.count).to_not eq(0)
 end 
end 