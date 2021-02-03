FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {'test00'}
    password_confirmation {password}
    last_name{'山田'}
    first_name{'太郎'}
    last_name_kana{'ヤマダ'}
    first_name_kana{'タロウ'}
    day_of_birth{'2020/10/01'}
  end
end