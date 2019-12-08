class PrefecturesController < ApplicationController
  def show
    @items = Item.where(prefecture_id: params[:id])
  end
end
