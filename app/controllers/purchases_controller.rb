class PurchasesController < ApplicationController

  before_action :set_credit_card

  require 'payjp'

  def create
    item = Item.find(params[:item_id])
    # クレジット決済
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      customer: @credit_card.customer_id, 
      currency: 'jpy'
    )
    
    # 販売手数料を取得
    sales_commission = SalesCommission.first
    # 販売手数料から利益を計算
    profit = item.calc_frofit(sales_commission.rate)
    
    # やることリストを作成
    todolist = Todolist.new
    todolist.buyer_todo(current_user, item)
    todolist = Todolist.new
    todolist.seller_todo(item)
    
    # 決済金額を売上に加算
    sales_management = SalesManagement.first
    sales_management.add_sales(item.price)
    sales_management.save

    # 購入情報を作成
    purchase = Purchase.new(user_id: current_user.id,
                            item_id: item.id,
                            price:   item.price,
                            profit:  profit,
                            pay_flg: 0)
    # ステータスを1:購入済に更新
    item.status = 1

    if item.save && purchase.save
    else
      redirect_to new_item_purchase_path(item)
    end
  end

  def new
    if @credit_card.blank?
      redirect_to controller: "credit_cards", action: "new"
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)    
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)

      @item = Item.find(params[:item_id])
      @send_address = current_user.send_address
    end
  end


  private
  def item_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def set_credit_card
    @credit_card = current_user.credit_cards.first
  end
    
end
