# == Schema Information
#
# Table name: issues
#
#  id         :bigint           not null, primary key
#  number     :bigint
#  title      :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :issue do
    number  { Faker::Number.number(digits: 5) }
    title   { Faker::Company.type }
  end

  factory :issue_params do
    trait :call_method_params do
      issue_number    { Faker::Number.number(digits: 4) }
      issue_title     { Faker::Lorem.sentence }
      issue_username  { Faker::Name.name }
      issue_action    { "opened" }
    end
  end

  
end
