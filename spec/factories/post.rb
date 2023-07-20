FactoryBot.define do
  factory :post do
    title { 'How to test a controller properly' }
    content { 'To test a controller properly, you should...' }
    author { FactoryBot.create(:user) }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
