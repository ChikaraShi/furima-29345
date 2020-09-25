class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase

  belongs_to_active_hash :type
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_date

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :introduce
    validates :type_id
    validates :condition_id
    validates :ship_fee_id
    validates :ship_from_id
    validates :ship_date_id
    validates :price
  end
  validates :type_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :ship_fee_id, numericality: { other_than: 1 }
  validates :ship_from_id, numericality: { other_than: 1 }
  validates :ship_date_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true }
  validates :price, inclusion: { in: 300..9_999_999 }
end
