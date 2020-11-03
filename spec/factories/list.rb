FactoryBot.define do
  factory :list do
    name { 'Lista Compartilhada' }
    shared { true }
    user

    trait :private do
      name { 'Lista Privada' }
      shared { false }
    end
  end
end
