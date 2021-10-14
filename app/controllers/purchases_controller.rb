class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:furima_id])
    @purchase_address = PurchaseAddress.new
    #@purchase_address = purchase_address.find(params[:id])
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
    #binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end


end