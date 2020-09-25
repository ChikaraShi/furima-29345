FactoryBot.define do
  factory :user do
    nick_name  { 'tarou' }
    email    { 'gji@com' }
    password { '1234abcd' }
    password_confirmation { password }
    kanji_fam   { 'ほげ' }
    kanji_given { '太郎' }
    kana_fam { 'ホゲ' }
    kana_given { 'タロウ' }
    birth {'2015-12-31'}
  end
end
