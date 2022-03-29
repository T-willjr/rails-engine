require 'rails_helper'

RSpec.describe "Get All Merchants" do 
 it "sends a list of merchants" do 
    create_list(:merchant, 3)
    create_list(:item, 3)

    get "/api/v1/merchants"

    merchants = JSON.parse(response.body, symbolize_names: true)  
      
    expect(response).to be_successful 
    expect(merchants.count). to eq(3)

    expect(merchants.last).to have_key(:id)
    expect(merchants.last[:id]).to be_an(Integer)

    expect(merchants.last).to have_key(:name)
    expect(merchants.last[:name]).to be_a(String)

    expect(merchants.count).to_not eq(0)
 end 
end 