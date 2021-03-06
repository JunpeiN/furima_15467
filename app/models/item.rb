class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :until_shipping
  belongs_to :user
  has_one_attached :image
  has_one :buyer
  has_one :address
  has_many :comments

  with_options presence: true do
    validates :name
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description
    validates :category
    validates :delivery_cost
    validates :prefecture
    validates :status
    validates :until_shipping
  end

  with_options numericality: { other_than: 1, message: "を選んでください"} do
    validates :category_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :status_id
    validates :until_shipping_id
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end

