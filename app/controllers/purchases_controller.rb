class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:furima_id])
    @purchase_address = PurchaseAddress.new
    if @item.purchase.present? || current_user.id == @item.user.id
           redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:furima_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid? 
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def purchase_params
  params.require(:purchase_address).permit(:postal_code, :ship_from_address_id, :municipality, :address, :building, :tell, :purchase).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],
      currency: 'jpy'
  )
  end


end