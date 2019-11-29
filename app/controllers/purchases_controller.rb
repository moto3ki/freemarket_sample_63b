class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end

  def create
    
    item = Item.find(params[:item_id])
    item.status = 1

    purchase = Purchase.new(item_params)

    if item.save && purchase.save
      redirect_to root_path
    else
      render new
    end
  end

  private
  def item_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end
