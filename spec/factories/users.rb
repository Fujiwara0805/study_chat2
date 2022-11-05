FactoryBot.define do
  factory :user do
      nickname              {Faker::Name.initials}
      email                 {Faker::Internet.free_email}
      password               {'test1234test'}
      password_confirmation  { password }
  end
end
