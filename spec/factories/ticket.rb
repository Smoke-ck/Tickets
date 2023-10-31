FactoryBot.define do
  factory :ticket do
    request_number { Faker::Lorem.words(number: rand(2..4)).join(' ') }
    sequence_number { 12345 }
    request_type { Faker::Lorem.words(number: rand(2..4)).join(' ') }
    request_action { Faker::Lorem.words(number: rand(2..4)).join(' ') }
  end
end
