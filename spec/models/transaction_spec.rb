require 'rails_helper'

describe Transaction do

  describe 'unique_transaction_id' do
    it 'should generate 5 digits id' do
      expect(Transaction.unique_transaction_id.length) == 5
    end
  end
end