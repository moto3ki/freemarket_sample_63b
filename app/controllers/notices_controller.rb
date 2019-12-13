class NoticesController < ApplicationController
  before_action :set_notice

  def show
    @item = @notice.item
    if @notice.type_no == 1 && @item.send_flg == 1
      @todolist = @item.todolists.where(todo_no: 2).first
      update_already_read
      redirect_to todolist_path(@todolist)
    else
      @buyer = @item.purchase.user
      @prefecture = Prefecture.find(@buyer.send_address.prefecture_id)
      update_already_read
    end
    
  end

  private
  def set_notice
    @notice = Notice.find(params[:id])
  end

  def update_already_read
    @notice.already_read
    @notice.save
  end
end
