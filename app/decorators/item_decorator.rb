# frozen_string_literal: true

module ItemDecorator
  def postage_set
    
    case delivery_method
    when 1
      "送料込み"
    when 2
      "着払い"
    end
  end

  def item_list_title
    prefecture.name + "の商品一覧"
  end
end
