# frozen_string_literal: true

module SalesHistoryDecorator

  def sales_message
    if price > 0
      return "販売利益"
    else
      return "商品購入"
    end
  end
end
