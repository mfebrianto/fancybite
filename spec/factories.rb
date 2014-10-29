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