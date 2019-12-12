class NoticesController < ApplicationController
  before_action :set_notice

  def show
    @item = @notice.item
    @buyer = @item.purchase.user
    @prefecture = Prefecture.find(@buyer.send_address.prefecture_id)
  end

  private
  def set_notice
    @notice = Notice.find(params[:id])
  end
end
