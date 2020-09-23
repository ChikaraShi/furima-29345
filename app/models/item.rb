class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :introduce
    validates :type_id
    validates :codition_id
    validates :ship_fee_id
    validates :ship_from_id
    validates :ship_date_id
    validates :price
    validates :user
  end
  validates :price, numericality: { only_integer: true }
  validates :price, inclusion: { in: 300..9999999 }

end