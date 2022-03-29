require 'rails_helper'

RSpec.describe "Get One Merchant" do  
	it "Sends one merchant" do 
		create_list(:merchant, 2)	
		merchant1 = Merchant.first 
		merchant2 = Merchant.last

		get "/api/v1/merchants/#{merchant1.id}"

		merchant = JSON.parse(response.body, symbolize_names: true) 

		expect(response).to be_successful 
    expect(merchant.count).to eq(4)
		
    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to be_an(Integer)
		
    expect(merchant).to have_key(:name)
    expect(merchant[:name]).to be_a(String)
    expect(merchant[:name]).to eq(merchant1.name)
		
		expect(merchant[:id]).to_not eq(merchant2.id)
    expect(merchant.count).to_not eq(0)
  end 
end 
