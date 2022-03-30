require 'rails_helper' 

RSpec.describe "Creates An Item" do  
  it "creates one item" do 
    merchant = create(:merchant)
    create(:item, merchant_id: merchant.id)

    item_params = ({ 
            name: "Fig Newtons",
            description: "Yum", 
            unit_price: 9.17,
            merchant_id: merchant.id
        })
     
 

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)

    created_item = Item.last 
    item2 = Item.first 
    
    expect(response).to be_successful 
    
		expect(created_item.name).to eq(item_params[:name])
		expect(created_item.description).to eq(item_params[:description])
		expect(created_item.unit_price).to eq(item_params[:unit_price])
		expect(created_item.merchant_id).to eq(item_params[:merchant_id])
    
    expect(created_item.id).to_not eq(item2.id)
		expect(created_item.name).to_not eq(item2.name)
  end 
end 