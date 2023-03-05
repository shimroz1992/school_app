FactoryBot.define do
  factory :course do
    name { 'tesohn' }
    sub_name  { 'Doe' }
    start_at { Time.current }
    end_at { Time.current + 1.hours }
    fees { '10,000' }
    tutor_name { 'test name' }
    course_duration { '5 months' }
    description { 'test description' }
  end
end 