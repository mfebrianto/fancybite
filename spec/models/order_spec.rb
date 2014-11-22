require 'rails_helper'

describe Order do


  describe 'on create' do

    before(:each) do
      ActionMailer::Base.deliveries.clear
      customer = Customer.create!(name: 'mynametest',
                                  email: 'myemail@domain.com',
                                  phone: '123456789')
      @transaction = Order.create!(customer_id: customer.id, order_id: 1)
    end

    describe 'unique_transaction_id' do
      it 'should generate 5 digits id' do
        expect(@transaction.transfer_key.length) == 5
      end
    end

    describe 'send_email' do
      it 'should sent successfully' do
        expect(ActionMailer::Base.deliveries.count) == 1
        expect(ActionMailer::Base.deliveries.first.subject) == 'Fancybite order detail'
      end
    end
  end

end