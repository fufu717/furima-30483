class Item < ApplicationRecord
  has_one :user
  has_one :purchase
  has_one_attached :image, depemdemt: :destroy
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :prefecture 

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
