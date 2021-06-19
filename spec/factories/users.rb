FactoryBot.define do
  factory :user do
    name { '鈴木suzuki' }
    email { 'hoge@hoge.com' }
    password { '11111a' }
    password_confirmation { '11111a' }
    first_name_full_width { '鈴木' }
    first_name_kana_full_width { 'スズキ' }
    last_name_full_width { '雅俊' }
    last_name_kana_full_width { 'マサトシ' }
    birthday { 19_920_220 }
  end
end
