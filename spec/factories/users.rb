FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name { 'あああ' }
    first_name  { 'いいい' }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birthday { 0o000 - 0o0 - 0o0 }
  end
end
