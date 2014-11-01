require 'rails_helper'

describe CustomerLogin do

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe 'check email and password exist' do
    it 'should return error if not exist' do
      customer_login.valid?
      expect(customer_login.errors[:email].first).to be == ' or password does not exist'
    end
  end

end