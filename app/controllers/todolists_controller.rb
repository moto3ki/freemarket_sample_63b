class TodolistsController < ApplicationController

  def show
    @todolist = Todolist.find(params[:id])
    @item = @todolist.item
    @buyer = @item.purchase.user
    @prefecture = Prefecture.find(@buyer.send_address.prefecture_id)
  end

end
