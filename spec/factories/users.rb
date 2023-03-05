FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { 'john@email_provider.com' }
    password { '12345678' }
  end
end
