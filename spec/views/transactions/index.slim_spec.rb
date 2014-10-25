require 'rails_helper'

describe 'transactions/index' do

  let(:error_message_hasnt_purchased) {'You hasnt purchased anything yet'}
  let(:error_message_blank) {"is required"}

  context 'error message' do
    context 'if no item bought yet' do

      before(:each) do
        order = Order.new
        order.errors.add(:name, error_message_hasnt_purchased)
        assign(:order, order)
        customer = Customer.new
        customer.addresses.build
        assign(:customer, customer)
      end

      it 'should render error message' do
        expect(render).to match /#{error_message_hasnt_purchased}/im
      end
    end

    context 'if no customer information' do

      before(:each) do
        assign(:order, Order.new)
        customer = Customer.new
        customer.addresses.build
        customer.valid?
        assign(:customer, customer)
      end

      it 'returns error if do not have name' do
        expect(render).to match /Name #{error_message_blank}/im
      end

      it 'returns error if do not have Email' do
        expect(render).to match /Email #{error_message_blank}/im
      end

      it 'returns error if do not have Phone' do
        expect(render).to match /Phone #{error_message_blank}/im
      end
    end
  end

end
