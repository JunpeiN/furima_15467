class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item

  with_options presence: true do
    validates :prefecture_id ,numericality: { other_than: 1 }
    validates :city 
    validates :address
    validates :phone_number
    validates :postal_code
  end
end
