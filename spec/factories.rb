FactoryGirl.define do
  factory :menu_category do
    name "pie"
  end
end

FactoryGirl.define do
  factory :menu_item do
    name "chocolate pie"
    picture { File.new("#{Rails.root}/spec/support/profile-pic.jpg") }
    association :menu_category, factory: :menu_category
  end
end

FactoryGirl.define do
  factory :order do
    name "customer"
  end
end

FactoryGirl.define do
  factory :order_detail do
    association :order, factory: :order
    association :menu_item, factory: :menu_item
  end
end

FactoryGirl.define do
  factory :registered_customer do
    name 'clairine felicia'
    email 'clairinemichael@gmail.com'
    phone '0817728208'
    password '12345678'
    password_confirmation '12345678'
  end
end

FactoryGirl.define do
  factory :transaction do
    association :customer, factory: :registered_customer
    association :order, factory: :order
  end
end