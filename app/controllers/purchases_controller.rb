class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if @item.purchase.present? || current_user.id == @item.user.id
  end

  def create
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
    params.require(:purchase_address).permit(:postal_code, :ship_from_address_id, :municipality, :address, :building, :tell, :purchase).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_purchase
    @item = Item.find(params[:furima_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
