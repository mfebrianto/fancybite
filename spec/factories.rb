FactoryGirl.define do

  factory :menu_category do
    name "pie"
  end

  factory :menu_item do
    name "chocolate pie"
    picture { File.new("#{Rails.root}/spec/support/profile-pic.jpg") }
    association :menu_category, factory: :menu_category
  end

  factory :registered_customer do
    name 'clairine felicia'
    email 'clairinemichael@gmail.com'
    phone '0817728208'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :customer_order do
    association :customer, factory: :registered_customer
  end


  factory :order_detail do
    association :menu_item, factory: :menu_item
    association :customer_order, factory: :customer_order
  end



end