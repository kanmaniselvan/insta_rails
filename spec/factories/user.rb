FactoryBot.define do
  factory :user do
    full_name 'John'
    username 'Man'
    provider 'instagram'
    uid SecureRandom.uuid
    profile_picture ''
  end
end
