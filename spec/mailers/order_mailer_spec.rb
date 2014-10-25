require 'rails_helper'

describe OrderMailer do
  describe 'instructions' do
    let(:customer) { Customer.new(name: 'Lucas', email: 'lucas@email.com') }
    let(:mail) { OrderMailer.order_confirmation(customer) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Fancybite order detail')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([customer.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['order@fancybite.com'])
    end
  end
end