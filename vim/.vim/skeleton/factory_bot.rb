FactoryBot.define do
  factory :model do
    sequence(:name) { |n| "#{n}" }
    field "value"
    relation
  end
end
