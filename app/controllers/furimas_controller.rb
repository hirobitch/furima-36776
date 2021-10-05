class FurimasController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end



  #念の為記述
  #private

  #def message_params
    #params.require(:item_name).permit(:content, :image).merge(user_id: current_user.id)
  #end

end
