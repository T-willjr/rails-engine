FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Finance.credit_card }
    credit_card_expiration_date { nil }
    result { [0,1].sample }
  end
end  