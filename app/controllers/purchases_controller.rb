class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:furima_id])
    @purchase_address = PurchaseAddress.new
    #@purchase_address = purchase_address.find(params[:id])
  end

  def create
    binding.pry
    @item = Item.find(params[:furima_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def purchase_params
  params.require(:purchase_address).permit(:user, :item, :postal_code, :ship_from_address_id, :municipality, :address, :building, :tell, :purchase).merge(user_id: current_user.id)
  end

end

