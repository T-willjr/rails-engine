class Api::V1::ItemsController < ApplicationController 
  def index 
    render json: ItemSerializer.new(Item.all)
  end 

  def show
    if params[:name].present?
      item = Item.search(params[:name]).first 
      render json: ItemSerializer.new(Item.find(item.id))
    else 
      render json: ItemSerializer.new(Item.find(params[:id]))
    end
  end 

  def create 
    render json: Item.create(item_params)
  end 

  def update 
    render json: Item.update(item_params)
  end 

  def destroy 
    render json: Item.destroy(params[:id])
  end 

  private 

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end 
end 