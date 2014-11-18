require 'rails_helper'

describe 'order_history/index' do




  describe 'render' do

    before(:each) do
      @transaction = FactoryGirl.create(:order_with_order_detail)
      # FactoryGirl.create(:order_with_order_detail)
      # assign(:transaction_history, Transaction.all)
      # assign(:transaction, @transaction)
    end

    it 'should show id' do
      # expect(render).to match /#{@transaction.id}/
    end

    it 'should show detail if exist' do
      puts ">>>>>>>>>>>>#{CustomerOrder.first.order.inspect}"
      puts ">>>>>>>>>>>>#{CustomerOrder.first.order.order_details.inspect}"
      # expect(render).to match /#{@order_detail.menu_item.name}/
    end
  end
end