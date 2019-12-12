class CreditCardsController < ApplicationController
  before_action :set_categories, only: [:new, :show]

  require "payjp"

  def new
    credit_card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if credit_card.exists?
  end

  def pay
    
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
      redirect_to action: "new"
  end

  def show
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(credit_card.card_id)
    end
  end

  private

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end