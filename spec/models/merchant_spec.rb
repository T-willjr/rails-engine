require 'rails_helper' 

RSpec.describe Merchant do 
  it "can return all Merchants from search result" do 
    merchant = create(:merchant, name: "Tod")
    merchant2 = create(:merchant, name: "Toad")
    merchant3 = create(:merchant, name: "Tommy")
    create_list(:merchant, 2)
    
    search_results = Merchant.search("To")
    
    expect(search_results.include?(merchant)).to be true 
    expect(search_results.include?(merchant2)).to be true 
    expect(search_results.include?(merchant3)).to be true 
  end 
end 