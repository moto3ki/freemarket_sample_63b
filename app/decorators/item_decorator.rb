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

  def condition_set
    case condition
    when 1
      "新品、未使用"
    when 2
      "未使用に近い"
    when 3
      "目立った傷や汚れなし"
    when 4
      "やや傷や汚れあり"
    when 5
      "傷や汚れあり"
    when 6
      "全体的に状態が悪い"
    else
      "--"
    end
  end
  
  def delivery_charge_set
    case delivery_charge
    when 1
      return "送料込み(出品者負担)"
    when 2
      return "着払い(購入者負担)"
    else
      "--"
    end
  end

  def delivery_method_set
    case delivery_method
    when 1
      "未定"
    when 2
      "らくらくメルカリ便"
    when 3
      "ゆうメール"
    when 4
      "レターパック"
    when 5
      "普通郵便(定形、定形外)"
    when 6
      "クロネコヤマト"
    when 7
      "ゆうパック"
    when 8
      "クリックポスト"
    when 9
      "ゆうパケット"
    else
      "--"
    end
  end

  def delivery_period_set
    case delivery_period
    when 1
      "1~2日で発送"
    when 2
      "2~3日で発送"
    when 3
      "4~7日で発送"
    end
  end
end
