FactoryGirl.define do

  factory :order_detail do
    order_test
  end

  factory :order do
    name "customer"

    factory :order_with_order_detail do
      after(:create) do |order|
        create_list(:order_detail, order_test: order)
      end
    end
  end

end
