FactoryBot.define do
  factory :user do
    name { 'nome' }
    email  { 'email@gmail.com' }
    password { 'secret123' }

    trait :testenildo do 
      name { 'testenildo' }
      email  { 'testenildo@ig.com' }
    end
  end
end
