class PurchasesController < ApplicationController

  before_action :set_credit_card

  require 'payjp'

  def create
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      customer: @credit_card.customer_id, 
      currency: 'jpy'
    )
    
    item.status = 1

    purchase = Purchase.new(item_params)
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
