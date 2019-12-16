class PrefecturesController < ApplicationController
  def show
    @items = Item.where(prefecture_id: params[:id]).order("created_at DESC")
  end
end
