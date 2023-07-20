FactoryBot.define do
  factory :like do
    user { FactoryBot.create(:user) }
    post { FactoryBot.create(:post) }
  end
end
