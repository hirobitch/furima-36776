class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path(@item)
    else
       render :new
    end
  end
  
  private

  def item_params
    params.require(:item).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
       redirect_to action: :index
    end
  end

end
