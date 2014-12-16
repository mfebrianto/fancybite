require 'rails_helper'

describe Order do


  describe 'on create' do

    before(:each) do
      ActionMailer::Base.deliveries.clear
      customer = Customer.create!(name: 'mynametest',
                                  email: 'myemail@domain.com',
                                  phone: '123456789')
      @order = Order.create!(customer_id: customer.id)
    end

    describe 'unique_transaction_id' do
      it 'should generate 5 digits id' do
        expect(@order.transfer_key.length) == 5
      end
    end

    describe 'send_email' do
      it 'should sent successfully' do
        expect(ActionMailer::Base.deliveries.count) == 1
        expect(ActionMailer::Base.deliveries.first.subject) == 'Fancybite order detail'
      end
    end

    describe 'generate_receipt' do
      it 'should generate pdf file' do
        @order.generate_receipt
      end
    end
  end

end