class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  KANAME_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nick_name
    validates :kanji_fam, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters and can't be blank" }
    validates :kanji_given, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters and can't be blank" }
    validates :kana_fam, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters and can't be blank" }
    validates :kana_given, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters and can't be blank" }
    validates :birth
  end

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/

  # def save
  #   # ユーザーの情報を保存し、「user」という変数に入れている
  #   user = User.create(name: name, name_reading: name_reading, nickname: nickname)
  #   # 住所の情報を保存
  #   Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
  #   # 寄付金の情報を保存
  #   Donation.create(price: price, user_id: user.id)
  # end
end

