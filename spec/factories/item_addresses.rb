FactoryBot.define do
  factory :item_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '港区' }
    home_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
