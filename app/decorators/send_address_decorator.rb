# frozen_string_literal: true

module SendAddressDecorator

  def join_address
    prefecture = Prefecture.find(prefecture_id)
    prefecture.name + city + address + building_name
  end

  def join_kanji_name
    kanji_last_name + kanji_first_name + " 様"
  end

end
