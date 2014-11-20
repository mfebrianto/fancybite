require 'rails_helper'

describe OrdersController do


  let(:menu_item) { create(:menu_item) }
  let(:order) { create(:order) }

  describe 'CREATE' do
    context 'new session' do

      before(:each) do
        session.clear
      end

      it 'creates new transaction' do
        expect { xhr :post, :create, menu_item_id: menu_item.id, quantity: 1 }.to change{ Order.count }.by(1)
      end
    end

    context 'existing session' do

      before(:each) do
        session['order_id'] = order.id
      end

      it 'should not create new transaction' do
        expect { xhr :post, :create, menu_item_id: menu_item.id, quantity: 1 }.to change{ Order.count }.by(0)
      end

      it 'should get details of the order' do
        xhr :post, :create, menu_item_id: menu_item.id, quantity: 1
        expect(assigns(:order_details)).not_to be_empty
      end

    end

  end

end