class TodolistsController < ApplicationController
  before_action :set_todolist

  def show
    @item = @todolist.item
    @buyer = @item.purchase.user
    @prefecture = Prefecture.find(@buyer.send_address.prefecture_id)
  end

  def update
    buyer_todo = Todolist.new
    buyer_todo.evaluate_todo(@todolist.item.purchase)
    if @todolist.update(status: 1)
      redirect_to action: "show"
    else
      render action: "show"
    end
  end

  private
  def set_todolist
    @todolist = Todolist.find(params[:id])
  end
end
