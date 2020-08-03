FactoryBot.define do
  factory :item do
    name            { "テスト商品" }
    price           { 300 }
    delivery_cost_id   { 2 }
    until_shipping_id  { 2 }
    prefecture_id      { 2 }
    category_id        { 2 }
    status_id          { 2 }
    description { '説明' }
    association :user
  end
end
