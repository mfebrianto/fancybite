require 'rails_helper'

describe 'checkouts/index' do

  let(:error_message_hasnt_purchased) {'You hasnt purchased anything yet'}

  before(:each) do
    order = Order.new
    order.errors.add(:name, error_message_hasnt_purchased)
    assign(:order, order)
    customer = Customer.new
    customer.addresses.build
    assign(:customer, customer)
  end

  context 'if no item bought yet' do
    it 'should render error message' do
      expect(render).to match /#{error_message_hasnt_purchased}/im
    end
  end

end
