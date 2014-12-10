require 'rails_helper'

describe SessionsController do

  describe 'login' do

    let(:registered_customer) {create(:registered_customer)}

    context 'success' do
      it 'should save customer id to session' do
        post :login, customer_login: { email: registered_customer.email,
                                       password: registered_customer.password }
        expect(session['registered_customer_id']).to eq registered_customer.id
      end

      it 'should redirect to check_session_frontpage_index_url' do
        post :login, customer_login: { email: registered_customer.email,
                                       password: registered_customer.password }
        expect(session['registered_customer_id']).to redirect_to(check_session_frontpage_index_url)
      end
    end
  end

  describe 'logout' do
    it 'should make registered_customer_id session id to nil' do
      post :logout
      expect(session['registered_customer_id']).to be_nil
    end
  end

end