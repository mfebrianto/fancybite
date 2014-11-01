require 'rails_helper'

describe RegisteredCustomer do

  it { should validate_presence_of :password }
  it { should validate_presence_of :password_confirmation }


  describe 'check password length' do
    it 'should return error if less than 8 characters' do
      registered_customer = RegisteredCustomer.new(password: '123456')
      registered_customer.valid?
      expect(registered_customer.errors[:password][0]).to be == 'must at least 8 characters long'
    end
  end

  describe 'check_password_equal_password_confirmation' do
    it 'should return error if not' do
      registered_customer = RegisteredCustomer.new(password: 'this is my password',
                                                   password_confirmation: 'this is not my password')
      registered_customer.valid?
      expect(registered_customer.errors[:password_confirmation]).not_to be_empty
    end
  end

end