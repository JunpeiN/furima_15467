class Buyer < ApplicationRecord
  belong_to :user
  belong_to :item
end
