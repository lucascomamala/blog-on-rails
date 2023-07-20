FactoryBot.define do
  factory :user do
    name { 'Lucas' }
    photo { 'a' }
    bio do
      'Self-taught web developer with over 2 years of experience working on complex software development.'
    end
    posts_counter { 0 }
  end
end
