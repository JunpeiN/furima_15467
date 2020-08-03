class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  zkaku = /\A[ぁ-んァ-ン一-龥]/
  zkana = /\A[ァ-ヶー－]+\z/
  eisu = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: zkaku } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: zkana } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
  validates :password, confirmation: true, format: { with: eisu }
end
