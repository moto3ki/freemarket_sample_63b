class PurchasesController < ApplicationController

  before_action :set_credit_card

  require 'payjp'

  def create
    balance    = 0
    use_credit = true
    use_sales  = false

    item = Item.find(params[:item_id])
    # 売上金を利用する場合
    if purchase_params.present? &&
      purchase_params[:use_sales] == "1"
      # ユーザの売上金から商品価格を引いた値を計算
      balance = current_user.confirm_sub_price(item.price)
      # 売上金のみで決済できる場合
      if balance >= 0
       use_credit = false
      end
      use_sales = true
    end

    if use_sales
      current_user.sub_sales(item.price)
    end

    if use_credit
      # クレジット決済する金額を設定
      credit_kessai_money = use_sales ? balance.abs : item.price
      # クレジット決済
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
        amount: credit_kessai_money,
        customer: @credit_card.customer_id, 
        currency: 'jpy'
      )
    end
    # 販売手数料のレートを取得
    sales_commission = SalesCommission.first
    # レートから利益を計算
    profit = item.calc_frofit(sales_commission.rate)
    fee = item.price - profit
    
    # 出品者へやることリストを作成
    todolist = Todolist.new
    todolist.send_item_todo(current_user, item)
    # 購入者へお知らせを作成
    notice = Notice.new
    notice.purchased_item_to_buyer(current_user, item)
    
    # 決済金額を売上に加算
    sales_management = SalesManagement.first
    sales_management.add_sales(item.price)
    sales_management.save

    # 購入情報を作成
    purchase = Purchase.new(user_id: current_user.id,
                            item_id: item.id,
                            price:   item.price,
                            profit:  profit,
                            pay_flg: 0,
                            fee:     fee)
    # ステータスを1:取引中に更新
    item.status = 1
    
    if item.save && purchase.save && current_user.save
    else
      redirect_to new_item_purchase_path(item)
    end
  end

  def new
    if @credit_card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)    
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
    end
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @send_address = current_user.send_address
  end


  private
  def item_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def set_credit_card
    @credit_card = current_user.credit_cards.first
  end
    
  def purchase_params
    if params[:purchase].present?
      params.require(:purchase).permit(:use_sales)
    end
  end
end
