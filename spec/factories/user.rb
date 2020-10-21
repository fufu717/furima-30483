FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'aaa@gmail.com' }
    password              { 'a00000' }
    password_confirmation { password }
    first_name            { '阿部' }
    last_name             { '太郎' }
    first_name_kana       { 'アベ' }
    last_name_kana        { 'タロウ' }
    birth_day             { '2020-10-13' }
  end
end
