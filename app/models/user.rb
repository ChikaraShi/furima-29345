class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nick_name
    validates :kanji_fam, format: { with: NAME_REGEX, message: "Last name Full-width characters and can't be blank" }
    validates :kanji_given, format: { with: NAME_REGEX, message: "First name Full-width characters and can't be blank" }
    validates :kana_fam, format: { with: KANAME_REGEX, message: "Last name kana Full-width katakana characters and can't be blank" }
    validates :kana_given, format: { with: KANAME_REGEX, message: "First name kana Full-width katakana characters and can't be blank" }
    validates :birth
  end

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
end
