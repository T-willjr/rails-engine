require 'rails_helper' 

RSpec.describe "Gets All Merchants Based on Search" do  
  it "sends all merchants from a search result" do 
    merchant = create(:merchant, name: "Tod")
    merchant = create(:merchant, name: "Toad")
    merchant = create(:merchant, name: "Tommy")
    create_list(:merchant, 2)
    search = "To"

    get "/api/v1/merchants/find?name=#{search}"
    
    search_results = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful 
    expect(search_results.count).to eq(1)
    expect(search_results[:data].first).to have_key(:id)
    
		expect(search_results[:data].first[:attributes]).to have_key(:name)
  end 
end 