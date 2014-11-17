FactoryGirl.define do

  factory :menu_category do
    name "pie"
  end

  factory :menu_item do
    name "chocolate pie"
    picture { File.new("#{Rails.root}/spec/support/profile-pic.jpg") }
    association :menu_category, factory: :menu_category
  end
end