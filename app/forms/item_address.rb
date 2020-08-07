class ItemAddress
  include ActiveModel::Model
  attr_accessor :home_number, :item_id, :user_id, :postal_code, :prefecture_id, :city, :building_name, :phone_number

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :home_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end

  def save
    # 住所の情報を保存
    Address.create(home_number: home_number, postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building_name: building_name, item_id: item_id)
    # 購入商品の情報を保存
    Buyer.create(item_id: item_id, user_id: user_id)
  end
end
