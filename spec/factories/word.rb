FactoryBot.define do
  factory :word do
    content { Faker::Lorem.word }
    language
    user

    trait :with_translations do
      after(:create) do |word|
        word.translations << create_list(:word, 2)
      end
    end
  end
end
