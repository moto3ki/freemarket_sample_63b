FactoryBot.define do

  factory :user do
    nickname              {"yamada"}
    email                 {"kkk@gmail.com"}
    password              {"aaaa0000"}
    kanji_last_name       {"山田"}
    kanji_first_name      {"太郎"}
    kana_last_name        {"ヤマダ"}
    kana_first_name       {"タロウ"}
    birth_day             {"2019-01-01"}
    tel_no                {"09011112222"}

  end

end