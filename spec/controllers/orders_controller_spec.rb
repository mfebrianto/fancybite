require 'rails_helper'

describe OrdersController do

  describe 'CREATE' do
    context 'new session' do

      before(:each) do
        session.clear
      end

      it 'creates new transaction' do
        menu_item = create(:menu_item)
        puts ">>>>>>menu_item>>>>>>#{menu_item.inspect}"
        xhr :create, {menu_item_id: menu_item.id,
                      quantity: 1}
      end
    end
  end

end