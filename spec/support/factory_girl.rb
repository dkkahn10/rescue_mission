require 'factory_girl'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Bananas#{n}" * 40}
    sequence(:description) { |n| "Noah" * 150}
  end

end
