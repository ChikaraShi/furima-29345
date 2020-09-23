class Items < ApplicationRecord
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
  validates :price, numericality: { :less_than_or_equal_to 300, :greater_than_or_equal_to 9999999 }

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zzA-Z].*[0-9])/
end

















end
