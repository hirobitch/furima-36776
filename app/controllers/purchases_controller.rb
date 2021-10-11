class PurchasesController < ApplicationController
  
  def index
    #@item = Item.find(params[:id])
    @purchase_address = PurchaseAddress.new
    #@purchase_address = purchase_address.find(params[:id])
  end

  def create
    @purchase = Purchase.create(purchase_params)
    ShippingAddress.(shipping_address_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_condition_id, :delivery_fee_id,
                                 :ship_from_address_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end

