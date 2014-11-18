require 'rails_helper'

describe OrdersController do


  let(:menu_item) { create(:menu_item) }
  let(:customer_order) { create(:customer_order) }

  describe 'CREATE' do
    context 'new session' do

      before(:each) do
        session.clear
      end

      it 'creates new transaction' do
        expect { xhr :post, :create, menu_item_id: menu_item.id, quantity: 1 }.to change{ CustomerOrder.count }.by(1)
      end
    end

    context 'existing session' do

      before(:each) do
        session['order_id'] = customer_order.id
      end

      it 'should not create new transaction' do
        expect { xhr :post, :create, menu_item_id: menu_item.id, quantity: 1 }.to change{ CustomerOrder.count }.by(0)
      end

    end

  end

end