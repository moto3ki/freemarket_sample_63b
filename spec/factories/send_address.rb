FactoryBot.define do

  factory :send_address do
    user_id               {1}
    kanji_last_name       {"山田"}
    kanji_first_name      {"太郎"}
    kana_last_name        {"ヤマダ"}
    kana_first_name       {"タロウ"}
    post_code             {"123-4567"} 
    prefecture_id         {"1"}
    city                  {"藤沢市"}
    address               {"善行１−１−１"}

  end

end
