require 'rails_helper'
require 'securerandom'

describe RegisteredCustomer do

  it { should validate_presence_of :password }
  it { should validate_presence_of :password_confirmation }

  describe 'check_email_already_exist' do
    context 'exist' do
      it 'returns error' do
        registered_customer = FactoryGirl.create(:registered_customer)
        new_customer = RegisteredCustomer.new(name: 'user_test',
                                              email: registered_customer.email,
                                              phone: '0817728208',
                                              password: 'password',
                                              password_confirmation: 'password')
        new_customer.valid?
        expect(new_customer.errors[:email][0]).to be == 'that you use has been registered'
      end
    end
    context 'not exist' do
      it 'does not return error' do
        new_customer_email = "#{SecureRandom.urlsafe_base64(5)}@email.com"
        new_customer = RegisteredCustomer.new(name: 'user_test',
                                              email: new_customer_email,
                                              phone: '0817728208',
                                              password: 'password',
                                              password_confirmation: 'password')
        new_customer.valid?
        expect(new_customer.errors.count).to be == 0
      end
    end
  end

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