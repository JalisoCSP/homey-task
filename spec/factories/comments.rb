FactoryBot.define do
  factory :comment do
    content { "This is a comment." }
    association :user
    association :project
  end
end
