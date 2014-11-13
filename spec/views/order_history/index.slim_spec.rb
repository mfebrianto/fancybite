require 'rails_helper'

describe 'order_history/index' do

  describe 'render' do
    it 'should show id' do
      transaction = FactoryGirl.create(:transaction)
      assign(:transaction_history, Transaction.all)
      expect(render).to match /#{transaction.id}/
    end
  end

end