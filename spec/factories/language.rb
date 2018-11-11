FactoryBot.define do
  factory :language do
    name { 'English' }

    trait :polish do
      name { 'Polish' }
    end
  end
end
