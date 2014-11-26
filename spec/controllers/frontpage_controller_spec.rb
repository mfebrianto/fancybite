require 'rails_helper'

describe FrontpageController do

  describe 'check_session' do
    context 'already login' do
      it 'return true' do
        session['registered_customer_id'] = '1'
        session['customer_id'] = ''
        session['original_request'] = ''
        expect(controller.check_session).to eq true
      end
    end
  end

end