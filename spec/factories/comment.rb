FactoryBot.define do
  factory :comment do
    text { 'This is a comment' }
    user { FactoryBot.create(:user) }
    post { FactoryBot.create(:post) }
  end
end
