FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aiueo1' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太朗' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1990-10-19' }
  end
end
