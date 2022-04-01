require 'rails_helper' 

RSpec.describe "Gets All Merchants Based on Search" do  
  it "sends all merchants from a search result" do 
    merchant1 = build_stubbed(:merchant, name: "Tod")
    merchant2 = build_stubbed(:merchant, name: "Toad")
    allow(Merchant).to receive(:search).and_return([merchant1, merchant2])
    search = "To"

    get "/api/v1/merchants/find?name=#{search}"
    
    search_results = JSON.parse(response.body, symbolize_names: true)
    
    expect(Merchant).to have_received(:search).with(search).once
    expect(response).to be_successful 
    expect(search_results.count).to eq(1)
    expect(search_results[:data].count).to eq(2)
    expect(search_results[:data].first).to have_key(:id)
    
		expect(search_results[:data].first[:attributes]).to have_key(:name)
  end 
end 