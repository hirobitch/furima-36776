class FurimasController < ApplicationController

  def index
  end

  #念の為記述
  private

  def message_params
    params.require(:item_name).permit(:content, :image).merge(user_id: current_user.id)
  end

end
