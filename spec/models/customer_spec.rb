require 'rails_helper'

describe Customer do

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :phone }

  it 'should return error on invalid email' do
    invalid_email = %w(notanemail notanemail.com not@anemail)
    invalid_email.each do |invalid_email|
      customer = Customer.new(name: 'testname', phone: 'testphone', email: invalid_email)
      expect(customer.valid?).to be false
    end
  end

end
