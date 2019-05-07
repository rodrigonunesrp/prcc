class Order < ApplicationRecord
  belongs_to :user

  validates :model, presence: true
  validates :imei, presence: true
  validates :anual_price, presence: true

end
