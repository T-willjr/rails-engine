FactoryBot.define do
  factory :invoice do
    status { [0,1,2].sample }
  end
end
