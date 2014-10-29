require 'rails_helper'

describe TransactionsController do

  describe 'validation' do

  end

  describe 'GET show_guest_checkout_transactions' do
    it 'render template show_guest_checkout_transactions' do
      create(:order_detail)
      session['order_id'] = Order.first.id
      get :show_guest_checkout
      expect(response).to render_template('show_guest_checkout')
    end
  end

end
