FactoryBot.define do
  factory :feeling do
    title         {Faker::JapaneseMedia::Doraemon.character}
    body          {Faker::JapaneseMedia::Conan.character}
    association   :user
  end
end