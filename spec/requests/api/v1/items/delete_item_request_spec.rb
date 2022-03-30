require 'rails_helper' 

RSpec.describe "Deletes An Item" do  
  it "Deletes one item" do 
    merchant = create(:merchant)
    create(:item, merchant_id: merchant.id)
    deleted_item = create(:item, merchant_id: merchant.id)

    items = Item.all
    delete "/api/v1/items/#{deleted_item.id}"

    expect(response).to be_successful 
    expect(items.count).to eq(1)
    expect{Item.find(deleted_item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end 
end 