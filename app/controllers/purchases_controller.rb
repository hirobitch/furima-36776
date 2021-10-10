class PuchasesController < ApplicationController
  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    ShippingAddress.(shipping_address_params)
  end
end
