require 'rails_helper' 

RSpec.describe Item do 
  it "can return search result of search" do 
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)
    item = create(:item, name: "laptop", merchant_id: merchant.id)
    
    expect(Item.search("laptop").first).to eq(item)
  end 
end 