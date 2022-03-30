require 'rails_helper' 

RSpec.describe "Edits An Item" do  
  it "edits one item" do 
    merchant = create(:merchant)
    create(:item, merchant_id: merchant.id)
    original_item = create(:item, merchant_id: merchant.id)

    item_params = ({ 
            name: "Fig Newtons",
            description: "Yum", 
            unit_price: 9.17,
            merchant_id: merchant.id
        })

    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{original_item.id}", headers: headers, params: JSON.generate(item: item_params)

    
    new_item = Item.last 
    
    expect(response).to be_successful 
    
		expect(new_item.name).to eq(item_params[:name])
		expect(new_item.description).to eq(item_params[:description])
		expect(new_item.unit_price).to eq(item_params[:unit_price])
		expect(new_item.merchant_id).to eq(item_params[:merchant_id])
    
    expect(new_item.name).to_not eq(original_item.name)
  end 
end 