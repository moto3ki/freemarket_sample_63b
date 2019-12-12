class NoticesController < ApplicationController
  before_action :set_notice

  def show
    todolist_jump_flg = 0
    @item = @notice.item
    if @notice.type_no == 1 && @item.send_flg == 1
      todolist = @item.todolists.where(todo_no: 2).first
      todolist_jump_flg = 1
    else
      @buyer = @item.purchase.user
      @prefecture = Prefecture.find(@buyer.send_address.prefecture_id)
    end
    @notice.already_read
    @notice.save

    redirect_to todolist_path(todolist) if todolist_jump_flg == 0
  end

  private
  def set_notice
    @notice = Notice.find(params[:id])
  end
end
