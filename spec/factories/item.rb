FactoryBot.define do

  factory :item do
    user
    name              {"abcde"}
    explain           {"fghijk"}
    status            {1}
    condition         {"新品、未使用"}
    delivery_charge   {"送料込み(出品者負担)"}
    delivery_method   {"未定"}
    delivery_period   {"1~2日で発送"}
    price             {300}
    like_cnt          {100}
    prefecture_id     {3}
    category_id       {1}
  end

end
