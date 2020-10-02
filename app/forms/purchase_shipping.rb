class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postcode, :state_id, :city, :add_line, :building, :phone_number, :user_id, :token, :item_id

  with_options presence: true do
    validates :token
    validates :postcode
    validates :state_id
    validates :city
    validates :add_line
    validates :phone_number
  end

  validates_format_of :postcode, with: /\A\d{3}[-]\d{4}\z/
  validates :state_id, numericality: { other_than: 1 }
  validates :phone_number, numericality: { with: /\A\d{11}\z/ }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, state_id: state_id, city: city, add_line: add_line, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
