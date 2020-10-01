FactoryBot.define do
  factory :purchase_shipping do
    association :item
    association :user
    token {"tok_abcdefghijk00000000000000000"}
    postcode { 123-2345 }
    state_id { 3 }
    city { '大阪市' }
    add_line { '那区109-3' }
    building { '時期はいつ' }
    phone_number { '09087654321' }
  end
end
