# frozen_string_literal: true

module TodolistDecorator
  # 経過日数計算
  def days_elapsed
    
    keika_nissu = (Date.today - date).to_i
    if keika_nissu == 0
      return "今日"
    else
      return keika_nissu.to_s + "日前"
    end
  end
end
