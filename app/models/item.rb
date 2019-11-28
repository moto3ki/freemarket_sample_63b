class Item < ApplicationRecord

  belongs_to :user
  has_many :item_images, dependent: :destroy

  validates :name, presence: true

  # 商品状態の値設定
  def status_value
    case self.condition
    when 1
      return "新品、未使用"
    when 2
      return "未使用に近い"
    when 3
      return "目立った傷や汚れなし"
    when 4
      return "やや傷や汚れあり"
    when 5
      return "傷や汚れあり"
    when 6
      return "全体的に状態が悪い"
    else
      return "--"
    end
  end

  # 配送料負担の値設定
  def delivery_charge_value
    case self.delivery_charge
    when 1
      return "送料込み(出品者負担)"
    when 2
      return "着払い(購入者負担)"
    else
      return "--"
    end
  end

  # 配送方法の値設定
  def delivery_method_value
    case self.delivery_method
    when 1
      return "未定"
    when 2
      return "らくらくメルカリ便"
    when 3
      return "ゆうメール"
    when 4
      return "レターパック"
    when 5
      return "普通郵便(定形、定形外)"
    when 6
      return "クロネコヤマト"
    when 7
      return "ゆうパック"
    when 8
      return "クリックポスト"
    when 9
      return "ゆうパケット"
    else
      return "--"
    end
  end

  # 発送日目安の値設定
  def delivery_period_value
    case self.delivery_period
    when 1
      return "1~2日で発送"
    when 2
      return "2~3日で発送"
    when 3
      return "4~7日で発送"
    else
      return "--"
    end
  end

end
