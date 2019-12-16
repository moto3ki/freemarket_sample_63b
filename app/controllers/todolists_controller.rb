class TodolistsController < ApplicationController
  before_action :set_todolist

  def show
    @item = @todolist.item
    @buyer = @item.purchase.user
    @prefecture = Prefecture.find(@buyer.send_address.prefecture_id)
  end

  def update
    # 取引対象の商品を取得
    item = @todolist.item
    # 商品発送完了のTodoの場合
    if @todolist.todo_no == 1
      # 商品購入者へ発送したことを伝えるTodoを作成
      buyer_todo = Todolist.new
      buyer_todo.evaluate_todo(@todolist.item.purchase)
      # todolistを実施済に更新
      @todolist.complete_todo
      # 商品の送信を送付済に更新
      item.send_complete
      if @todolist.save && item.save && buyer_todo.save
        redirect_to action: "show"
      else
        render action: "show"
      end
    elsif @todolist.todo_no == 2
      
      seller = @todolist.item.user
      rate = seller.rate
      item = @todolist.item
      purchase = item.purchase
      
      # Todo実施済更新処理
      @todolist.complete_todo
      # 評価処理
      if rate.present?
        rate.rate_count_up(rate_params[:rate])
      else
        rate = Rate.new(user_id: seller.id)
        rate.rate_count_up(rate_params[:rate])
      end
      # 出品者への通知処理
      notice = Notice.new
      notice.rated_and_paid_to_seller(seller, item)
      # マスターから金額を引き落とす
      sales_management = SalesManagement.first
      sales_management.pay_money_add_profit(purchase.profit, purchase.fee)
      # 入金処理
      seller.add_sales(purchase.profit)
      # 支払い済に更新
      purchase.paid_money
      # 取引完了に更新
      item.status = 2

      if @todolist.save        &&
         rate.save             &&
         notice.save           &&
         seller.save           &&
         sales_management.save &&
         purchase.save         &&
         item.save
         # 売上履歴を作成
         SalesHistory.create(user_id: seller.id, 
                             notice_todolist_id: @todolist.id, 
                             notice_todolist_status: 2,
                             price: purchase.profit)
         redirect_to action: "show"
      else
        render :show
      end
    end
  end

  private
  def set_todolist
    @todolist = Todolist.find(params[:id])
  end

  def rate_params
    params.require(:todolist).permit(:rate)
  end

  def rate_judge
    case selected_rate
    when "good"
      self.good += 1
    when "normal"
      self.normal += 1
    when "bad"
      self.bad += 1
    end
  end
end
