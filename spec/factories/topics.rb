FactoryGirl.define do
  factory :topic do
    name "Super interesting topic"
    author "spiderman"
    state :open

    trait :closed do
      state :closed
    end
  end
end
