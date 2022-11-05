FactoryBot.define do
  factory :question do
    title                  {"test"}
    name                   {Faker::Name.initials}
    content                {Faker::Lorem.sentence}
    video                  {' '}
    youtube_url            {' '}

    association :user

  end
end
